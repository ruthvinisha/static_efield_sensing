import processing.serial.*;
Serial myPort; //COM port of Arduino
int xPos=10;//horizontal start point
int i=1;
float[] inByte= new float[40000]; //array for incoming bytes
void setup()
{
  size(800,600);//size of graph window
  println(Serial.list());//list of available COM ports
   myPort=new Serial(this, Serial.list()[1],9600);//value within [] is the one that the Arduino uses
  myPort.bufferUntil('\n');//dont generate serialEvent() until newline character
  background(180);//set backgraound colour
}
void draw()//must exist so that serialEvent() continuously executes
{}
 void serialEvent (Serial myPort)
  {
    String inString=myPort.readStringUntil('\n');//read ASCII string
      inByte[i]= float (inString); 
      inByte[i]=map(inByte[i],0,1023,0,height);//map the incoming bytes within window height
      textSize(10);
      color(255);
      text("Analog Read",width/2,10);
      
      stroke(1);
      strokeWeight(2);
      line (10,height,10,0);//line for y-axis
      line (0,height-10,width, height-10);//line for x-axis
      stroke(10);
      
      int x1Pos = xPos;
      float y1Pos = inByte[i-1];
      int x2Pos = xPos + 1;
      float y2Pos = inByte[i];
      
      println(x1Pos + "," + y1Pos + "," + x2Pos + "," + y2Pos);//prints the consecutive data points for signal
      line(xPos,inByte[i-1],++xPos,inByte[i++]);//graphs the signal for the incoming bytes
            
      if (xPos>=width)
      {
        xPos=10;//starts with new window once it reaches the width
        background(180);
      }
     }

