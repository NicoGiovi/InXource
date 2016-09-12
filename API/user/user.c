u8 receivedbyte;
char buffer[64];

void setup(){
  lcd_pins(0, 1, 2, 3, 4, 5, 0, 0, 0, 0); 
  lcd_begin(16, 2);

  pinmode(13, OUTPUT);

  lcd_noDisplay();
  lcd_display();
  lcd_setCursor(0,4);
  lcd_print("InXource");
  lcd_setCursor(2,1);
  lcd_print("Prueba.....");
  lcd_blink();
}

void loop()
{
    receivedbyte=0;
    if(BULK_available())
    {
      receivedbyte =BULK_read(buffer);
      buffer[receivedbyte] = 0;
      if (receivedbyte > 0)
        {
        lcd_clear();
        lcd_print(buffer);
        }
    }
}



