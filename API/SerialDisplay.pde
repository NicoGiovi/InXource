u8 receivedbyte;
char buffer[64];

void setup(){
  lcd.pins(0, 1, 2, 3, 4, 5, 0, 0, 0, 0); // RS, E, D4 ~ D8
  lcd.begin(16, 2);

  pinMode(13, OUTPUT);

  lcd.noDisplay();
  lcd.display();
  lcd.setCursor(0,4);
  lcd.print("InXource");
  lcd.setCursor(2,1);
  lcd.print("Prueba.....");
  lcd.blink();
}

void loop()
{
    receivedbyte=0;
    if(BULK.available())
    {
      receivedbyte =BULK.read(buffer);
      buffer[receivedbyte] = 0;
      if (receivedbyte > 0)
        {
        lcd.clear();
        lcd.print(buffer);
        }
    }
}
