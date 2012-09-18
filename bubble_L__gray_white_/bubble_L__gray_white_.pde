/**
 * Simple Read
 * 
 * Read data from the serial port and change the color of a ellipses that forms letter L
 * when a switch connected to a Wiring or Arduino board is pressed and released.
 * This example works with the Wiring / Arduino program that follows below.
 */


import processing.serial.*;

Serial myPort;  // Create object from Serial class
int val;      // Data received from the serial port
float col;      // color for filling the rectangle.

void setup() 
{
  size(500, 500);
  // I know that the first port in the serial list on my mac
  // is always my  FTDI adaptor, so I open Serial.list()[0].
  // On Windows machines, this generally opens COM1.
  // Open whatever port is the one you're using.
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
}

void draw()
{
  if ( myPort.available() > 0) {  // If data is available,
    String val = myPort.readStringUntil('\n');         // read it and store it in val
    if(val != null){
      println(val);
      col = float(val); // convert String to float value.     
    }
  }
  
  background(255);             // Set background to white
  fill(col);

int x0 = 50;
int x1 = 260;
int x2 = 120;


int y0 = 30;
int y1 = 220;
int y2 = 280;


int Y; //index variable for Y
int X; //index variable for X 
int grain_size = 10; // <- try to change this

fill(col);

for (Y = y0; Y < y2; Y = Y + grain_size) {
  for (X = x0; X < x2; X = X + grain_size) {
    //rect(X,  Y , 3, 3);
    ellipse( X, Y, grain_size, grain_size);
  }
}

for (Y = y1; Y < y2; Y = Y + grain_size) {
  for (X = x0; X < x1; X = X + grain_size) {
    //rect(X,  Y , 3, 3);
    ellipse( X, Y, grain_size, grain_size);
  }
}
 
}


