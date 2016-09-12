import os
import sys
import shutil
import re
from subprocess import Popen, STDOUT
import usb
# --- Caracterisitcas Placa Pinguino 18f4550 ---
board = {'bootloader': 'boot2', 'memstart': 0x2000, 'memend': 0x8000,
         'vendor': 0x04D8, 'product_id': 0xFEAA}

# --- Constantes De Rutas ----
API_DIR = os.path.abspath(sys.path[0])

if not API_DIR.endswith('API'):
    API_DIR = os.path.join(os.path.abspath(sys.path[0]), "API")

PDE_FILE = os.path.join(API_DIR, 'Blink.pde')
SDCC_DIR = os.path.join(API_DIR, 'p8')
SOURCE_DIR = os.path.join(API_DIR, 'user')
PINGUINO_DIR = os.path.join(API_DIR,'pinguino')
PINGUINO_CORE = os.path.join(os.path.join(API_DIR, 'pinguino'), "core")
PINGUINO_LIB = os.path.join(os.path.join(API_DIR, 'pinguino'), "libraries")
PINGUINO_LKR = os.path.join(os.path.join(API_DIR, 'pinguino'), 'lkr')
PINGUINO_OBJ = os.path.join(os.path.join(API_DIR, 'pinguino'), 'obj')
PINGUINO_PDL = os.path.join(os.path.join(API_DIR, 'pinguino'), 'pdl')
SDCC_BIN = os.path.join(os.path.join(SDCC_DIR, 'bin'), 'sdcc')
HEX_FILE = os.path.join(SOURCE_DIR, 'main.hex')

Data_Record = 0o0
End_Of_File_Record = 0o1
Extended_Linear_Address_Record  = 0o4
VSC_BLOCKSIZE = 32


# --- Fin Constantes ---
# --- Funciones Privadas

def eliminar_comentarios(textinput):
    if type(textinput) == type([]):
        text = "".join(textinput)
    else:
        text = textinput

    def replacer(match):
        s = match.group(0)
        if s.startswith('/'):
            # return "" #bug in line number in error info, multiline comments
            return "" + "\n" * (s.count("\n"))
        else:
            return s

    pattern = re.compile(
        r'//.*?$|/\*.*?\*/|\'(?:\\.|[^\\\'])*\'|"(?:\\.|[^\\"])*"',
        re.DOTALL | re.MULTILINE
    )
    textout = re.sub(pattern, replacer, text)

    if type(textinput) == type([]):
        textout = textout.split("\n")
        textout = map(lambda x: x + "\n", textout)

    return textout
def eliminar_strings(content):
    strings = re.findall(r'"[^"]*"', content)
    content = re.sub(r'"[^"]*"', '"<PINGUINO_STRING>"', content)

    index = 0
    keys = {}
    for string in strings:
        content = content.replace('"<PINGUINO_STRING>"', '"<PINGUINO_STRING:%d>"' % index, 1)
        keys['"<PINGUINO_STRING:%d>"' % index] = string
        index += 1

    return content, keys
def read_lib():
    """Load .pdl or .pdl32 files (keywords and libraries)
     trying to find PDL files to store reserved words."""
    regobject = []
    libinstructions = []
    libext = ".pdl"
    libdir = PINGUINO_DIR
    all_pdls = []
    all_pdls.extend(map(lambda pdl: os.path.join(libdir, "pdl", pdl), os.listdir(os.path.join(libdir, "pdl"))))

    all_pdls = filter(lambda name: name.endswith(libext), all_pdls)

    for fichier in all_pdls:

        # check content of the PDL file
        lib_file = open(fichier, "r")
        lines = lib_file.readlines()
        lib_file.close()

        regex_pdl = "[\s]*([.\w]*)[\s]*([\w]*)[\s]*(#include[\w\s\.\<\>/]*)*(#define.*)*[\s]*"

        for line in lines:
            line = line[:line.find('//')]
            if line.isspace() or not line: continue

            reg = re.match(regex_pdl, line)
            instruction, cnvinstruction, include, define = reg.groups()
            include = "" if include is None else include
            define = "" if define is None else define
            cnvinstruction = instruction if cnvinstruction is "" else cnvinstruction

            if not instruction: continue

            # https://regex101.com/r/nH9nS9
            regex = re.compile(ur"([^.\w])(%s)([^.\w])" % re.escape(instruction), re.MULTILINE | re.DOTALL)

            libinstructions.append([instruction, cnvinstruction, include, define, regex])

    libinstructions.sort(lambda x, y: cmp(len(x[0]), len(y[0])))
    libinstructions.reverse()

    return libinstructions[:]
def recove_strings(content, keys):
        for key in keys.keys():
            content = content.replace(key, keys[key])
        return content
def replace_word(content, libinstructions):

    defines = set()
    keys = {}
    index = 0

    # replace arduino/pinguino language and add #define or #include to define.h
    for instruction, cnvinstruction, include, define, regex in libinstructions:
        if re.search(regex, content):
            content = re.sub(regex, '\g<1><PINGUINO_RESERVED:%d>\g<3>' % index, content)  # safe

            keys['<PINGUINO_RESERVED:%d>' % index] = cnvinstruction
            index += 1

            defines.add(include + "\n")
            defines.add(define + "\n")

    content = recove_strings(content, keys)
    fichier = open(os.path.join(SOURCE_DIR,"define.h"), "a")
    fichier.writelines(defines)
    fichier.close()
    return content

def usbWrite(handle, usbBuf):
        """	Write a data packet to currently-open USB device """
        sent_bytes = handle.bulkWrite(0x01, usbBuf, 200)
        if not sent_bytes:
            print "Error escribiendo byte"
def eraseBlock(handle, address):
# ------------------------------------------------------------------------------
        """ erase 64 bytes of flash memory """
        # command
        cmd = 0x00
        # block address
        address = "%06X" % address
        addr_lo = int(address[4:6],16)
        addr_hi = int(address[2:4],16)
        addr_up = int(address[0:2],16)
        # write data packet
        usbBuf = chr(cmd) + chr(addr_lo) + chr(addr_hi) + chr(addr_up)
        usbWrite(handle, usbBuf)
def writeFlash(handle, address, datablock):
# ------------------------------------------------------------------------------
        """ write a block of code """
        # command
        cmd = 0x01
        # block's address
        address = "%06X" % address
        readbyte1 = int(address[4:6], 16)
        readbyte2 = int(address[2:4], 16)
        readbyte3 = int(address[0:2], 16)
        # add data to the packet
        usbBuf = chr(cmd) + chr(readbyte1) + chr(readbyte2) + chr(readbyte3)
        for i in range(len(datablock)):
            usbBuf = usbBuf + chr(datablock[i])
        # write data packet on usb device
        usbWrite(handle, usbBuf)


def writeHex(handle, filename, board):
    data = []
    old_address = 0
    max_address = 0
    address_Hi = 0
    codesize = 0

    fichier = open(filename, 'r')
    lines = fichier.readlines()
    fichier.close()
    i = 0
    for line in lines:
        byte_count = int(line[1:3], 16)
        address_Lo = int(line[3:7], 16)  # lower 16 bits (bits 0-15) of the data address
        record_type = int(line[7:9], 16)
        i += 1

        address = (address_Hi << 16) + address_Lo

        # checksum calculation
        end = 9 + byte_count * 2  # position of checksum at end of line
        checksum = int(line[end:end + 2], 16)
        cs = 0
        i = 1
        while i < end:
            cs = cs + (0x100 - int(line[i:i + 2], 16)) & 0xff  # not(i)
            i = i + 2
        if checksum != cs:
            print "Checksum error"

        # extended linear address record
        if record_type == Extended_Linear_Address_Record:
            address_Hi = int(line[9:13], 16) << 16  # upper 16 bits (bits 16-31) of the data address

        # code size
        if address >= board['memstart']:
            codesize = codesize + byte_count

        # max address
        if (address > old_address) and (address < board['memend']):
            max_address = address + byte_count
            old_address = address

    max_address = max_address + 64 - (max_address % 64)
    # self.txtWrite(output, "%d bytes to write\n" % codesize)

    # fill data sequence with 0xFF
    # ----------------------------------------------------------------------

    for i in range(board['memstart'], max_address + 64):
        data.append(0xFF)

    # 2nd pass : parse bytes from line into data
    # ----------------------------------------------------------------------

    address_Hi = 0

    for line in lines:
        byte_count = int(line[1:3], 16)
        address_Lo = int(line[3:7], 16)  # four hex digits
        record_type = int(line[7:9], 16)

        address = (address_Hi << 16) + address_Lo

        # data record
        if record_type == Data_Record:
            if (address >= board['memstart']) and (address < board['memend']):
                for i in range(byte_count):
                    data[address - board['memstart'] + i] = int(line[9 + (2 * i): 11 + (2 * i)], 16)
        # end of file record
        elif record_type == End_Of_File_Record:
            break
        # extended linear address record
        elif record_type == Extended_Linear_Address_Record:
            address_Hi = int(line[9:13], 16)  # upper 16 bits (bits 16-31) of the data address
        # unsupported record type
        else:
            print "HEX ERROR"

    # erase and write blocks
    # ----------------------------------------------------------------------

    usbBuf = []
    for addr in range(board['memstart'], max_address + 64):
        if addr % 64 == 0:
            eraseBlock(handle, addr)
        if addr % VSC_BLOCKSIZE == 0:
            if usbBuf != []:
                writeFlash(handle, addr - VSC_BLOCKSIZE, usbBuf)
            usbBuf = []
        if data[addr - board['memstart']] != []:
            usbBuf.append(data[addr - board['memstart']])
# ------------------------------------------------------------------------------

# --- Funciones Publicas ---
def prepropesar():
    if os.path.exists("main.hex"): os.remove("main.hex")
    if os.path.exists(os.path.join(SOURCE_DIR, "user.c")): os.remove(os.path.join(SOURCE_DIR, "user.c"))
    if os.path.exists(os.path.join(SOURCE_DIR, 'define.h')):
        os.remove(os.path.join(SOURCE_DIR, 'define.h'))
    fichier = open(os.path.join(SOURCE_DIR, 'define.h'), 'a')
    fichier.close()
    shutil.copy(PDE_FILE, os.path.join(SOURCE_DIR, "user.c"))
    fichier = open(os.path.join(SOURCE_DIR, "user.c"), "r")
    i = 0
    defines = set()
    file_line = {}
    readlines = fichier.readlines()
    readlines = eliminar_comentarios(readlines)

    for line in readlines:
        if line.find("#include") != -1 or line.find("#define") != -1:
            line = line[:line.find('//')]
            defines.add(line + "\n")  # add to define.h
            file_line[i] = " \n"  # delete from user.c
            i += 1
        else:
            file_line[i] = line
            i += 1
    fichier.close()

    fichier = open(os.path.join(SOURCE_DIR, "define.h"), 'w')
    fichier.writelines(defines)
    fichier.close()

    fichier = open(os.path.join(SOURCE_DIR, "user.c"), "w")
    for cpt in range(i):
        fichier.write(file_line[cpt])
    fichier.close()

    fichier = open(os.path.join(SOURCE_DIR, "user.c"), "r")
    content = fichier.read()
    content = eliminar_comentarios(content)
    content_nostrings, keys = eliminar_strings(content)
    content = content.split('\n')
    nblines = 0
    libinstructions = read_lib()
    content_nostrings = replace_word(content_nostrings, libinstructions) + "\n"
    content = recove_strings(content_nostrings, keys)
    fichier.close()

    fichier = open(os.path.join(SOURCE_DIR, "user.c"), "w")
    fichier.writelines(content)
    fichier.writelines("\r\n")
    fichier.close()

    fichier = open(os.path.join(SOURCE_DIR, "define.h"), "r")
    lignes = fichier.readlines()
    lignes.sort()
    fichier.close()

    fichier = open(os.path.join(SOURCE_DIR, "define.h"), "w")
    fichier.writelines(lignes)
    fichier.close()

def compilar():
    # FALTA HACER TODO EL PREPROCESAMIENTO DEL PDE Y DE LAS LIBRERIAS
    fichier = open(os.path.join(SOURCE_DIR, "stdout"), "w+")
    ListaArgsComp = [SDCC_BIN]
    ListaArgsComp.append("--verbose")
    ListaArgsComp.append("-mpic16")
    ListaArgsComp.append("--denable-peeps")
    ListaArgsComp.append("--obanksel=9")
    ListaArgsComp.append("--optimize-cmp")
    ListaArgsComp.append("--optimize-df")
    ListaArgsComp.append("-p18f4550")
    ListaArgsComp.append("-D PINGUINO4550")
    ListaArgsComp.append("-D boot2")
    ListaArgsComp.append("-DBOARD=PINGUINO4550")
    ListaArgsComp.append("-DPROC=18f4550")
    ListaArgsComp.append("-DBOOT_VER=2")
    ListaArgsComp.append("--use-non-free")
    ListaArgsComp.append("-I")
    ListaArgsComp.append(PINGUINO_CORE)
    ListaArgsComp.append("-I")
    ListaArgsComp.append(PINGUINO_LIB)
    ListaArgsComp.append("--compile-only")
    ListaArgsComp.append("-o")
    ListaArgsComp.append(SOURCE_DIR + "\main.o")
    ListaArgsComp.append(SOURCE_DIR + "\main.c")
    sdcc_proc = Popen(' '.join(ListaArgsComp), stdout=fichier, stderr=STDOUT)
    sdcc_proc.communicate()

def link():
    fichier = open(os.path.join(SOURCE_DIR, "stdout"), "w+")
    ListaArgsLink = [SDCC_BIN]
    ListaArgsLink.append("--verbose")
    ListaArgsLink.append("-mpic16")
    ListaArgsLink.append("--denable-peeps")
    ListaArgsLink.append("--obanksel=9")
    ListaArgsLink.append("--optimize-cmp")
    ListaArgsLink.append("--optimize-df")
    ListaArgsLink.append("--no-crt")
    ListaArgsLink.append("-Wl")
    ListaArgsLink.append("-s" + os.path.join(PINGUINO_LKR, "boot2.18f4550.lkr"))
    ListaArgsLink.append("-m")
    ListaArgsLink.append("-p18f4550")
    ListaArgsLink.append("-D boot2")
    ListaArgsLink.append("-D PINGUINO4550")
    ListaArgsLink.append("-DBOARD=PINGUINO4550")
    ListaArgsLink.append("-DPROC=18f4550")
    ListaArgsLink.append("-DBOOT_VER=2")
    ListaArgsLink.append("--use-non-free")
    ListaArgsLink.append("-I")
    ListaArgsLink.append(PINGUINO_CORE)
    ListaArgsLink.append("-I")
    ListaArgsLink.append(PINGUINO_LIB)
    ListaArgsLink.append('libio18f4550.lib')
    ListaArgsLink.append('libdev18f4550.lib')
    ListaArgsLink.append('libc18f.lib')
    ListaArgsLink.append('libm18f.lib')
    ListaArgsLink.append('libsdcc.lib')
    ListaArgsLink.append("-o")
    ListaArgsLink.append(SOURCE_DIR + "\main.hex")
    ListaArgsLink.append(os.path.join(PINGUINO_OBJ, 'application_iface.o'))
    ListaArgsLink.append(os.path.join(PINGUINO_OBJ, 'boot_iface.o'))
    ListaArgsLink.append(os.path.join(PINGUINO_OBJ, 'usb_descriptors.o'))
    ListaArgsLink.append(os.path.join(PINGUINO_OBJ, 'crt0ipinguino.o'))
    ListaArgsLink.append(os.path.join(SOURCE_DIR, 'main.o'))
    sdcc_proc = Popen(" ".join(ListaArgsLink), stdout=fichier, stderr=STDOUT)
    sdcc_proc.communicate()


def upload():
    pinguino = None
    busses = usb.busses()
    for bus in busses:
        for device in bus.devices:
            if (device.idVendor, device.idProduct) == (board['vendor'], board['product_id']):
                pinguino = device

    handle = pinguino.open()

    if handle:
        handle.setConfiguration(0x02)
        handle.claimInterface(0x00)
    writeHex(handle, HEX_FILE, board)

prepropesar()
compilar()
link()
upload()