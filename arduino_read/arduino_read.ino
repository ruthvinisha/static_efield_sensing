void setup()
{
  pinMode(13,OUTPUT);
  pinMode(12,INPUT);
  Serial.begin(9600);
}
void loop()
{
    int inByte=analogRead(12);
  Serial.println(inByte);
  if (inByte>350)
  digitalWrite(13,HIGH);
  delay(3);
  digitalWrite(13,LOW);
  delay(2);
}



