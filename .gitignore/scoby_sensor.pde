import processing.sound.*;

SoundFile file;
SoundFile file2;
SoundFile file3;


import processing.serial.*; 
boolean doPrint = true;

int end = 10;    
String serial;   
Serial port;  


void setup() {
  port = new Serial(this, Serial.list()[1], 9600); 
  port.clear(); 
  serial = port.readStringUntil(end); 
  serial = null; 

  file = new SoundFile(this, "softpress.mp3"); // 1

  file2 = new SoundFile(this, "mediumpress.mp3"); // 2

  file3 = new SoundFile(this, "hard.mp3"); //
}

//Sound File 
void play() {
  file.play();
}

void draw() {  
  while (port.available() > 0) 
  { 
    serial = port.readStringUntil(end);
  }
  if (serial != null) 
  {  
    String [] a = split(serial, ','); 
    float b = float(a[0]);

    println(b);


   //Light Press
   if (b >= 1 && b < 8) 
   {
    if (doPrint)
    {
     // println("Soft Press");
      file.play();
      doPrint = false;
    }
    //delay(25000);
    file.stop();
   } else doPrint = true;


   //Medium Press
   if (b >= 10 && b < 15) 
   {
    if (doPrint) 
    {
      //println("Medium Press");
      file2.play();
      doPrint = false;
    }
    //delay(22000);
    file2.stop();
   } else doPrint = true;
   //Hard Press
   if (b >= 20)
   {
    if (doPrint)
    {
   //   println("Hard Press");
      file3.play();
      doPrint = false;
    }
   // delay (30000);
    file3.stop();
   } else doPrint = true;
  // delay (50);
 }
}