import usb
import time
#----- Constantes ---
VENDOR = 0x04D8
PRODUCT = 0xFEAA

TIMEOUT = 10000
INTERFACE = 0
ENDPOINT_OUT = 0x01

CONFIGURATION = 0x03
ENDPOINT_IN = 0x82

buses = usb.busses()

for bus in buses:
    devices = bus.devices
    for dev in devices:
        if dev.idVendor == VENDOR and dev.idProduct == PRODUCT:
            pinguino = dev.open()
            print "Encontrado"

pinguino.setConfiguration(CONFIGURATION)
pinguino.claimInterface(INTERFACE)
print "Configurado"
buffer = "aProbandokjhhh"

pinguino.bulkWrite(ENDPOINT_OUT, buffer, TIMEOUT)
received = pinguino.bulkRead(ENDPOINT_IN, 64, TIMEOUT)
if received is not None:
    for char in received:
        print chr(char)
#pinguino.reset()

