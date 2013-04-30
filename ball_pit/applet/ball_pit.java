import processing.core.*; 
import processing.xml.*; 

import java.applet.*; 
import java.awt.Dimension; 
import java.awt.Frame; 
import java.awt.event.MouseEvent; 
import java.awt.event.KeyEvent; 
import java.awt.event.FocusEvent; 
import java.awt.Image; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 

public class ball_pit extends PApplet {

//Bouncing BALLZ

// [it's ARRAY TIME!!!] (And declaring universal variables)
Ball ballz[];
Pit pit;
int numBallz = 5;
float accel = .07f;

public void setup() {
  colorMode(HSB); //Sets the color mode
  size(500, 500, P3D); //Sets the size of the screen
  noStroke(); //Eliminates lines
  noFill();
  camera(width/2.0f, height/2.0f, -800, 
         width/2.0f, height/2.0f, 0, 
         0, 1, 0);

  ballz = new Ball[numBallz];
  for (int i = 0; i<numBallz; i++) {
    ballz[i] = new Ball(random(width), random(height), random(height),
    color(random(255), random(200, 255), random(50, 200)));
  }
  
  pit = new Pit(500);
  pit.ballz = ballz;
}

//Calls the needed functions to create the ball
public void draw() {
  background(200);
  pit.show();  
}

public void keyPressed() {
  if(key==CODED) {
    if(keyCode==UP) {
      for(int i = 0; i<numBallz; i++) {
        ballz[i].xAcc = 0;
        ballz[i].yAcc = -accel;
        ballz[i].zAcc = 0;
      }
    }
    if(keyCode==DOWN) {
      for(int i = 0; i<numBallz; i++) {
        ballz[i].xAcc = 0;
        ballz[i].yAcc = accel;
        ballz[i].zAcc = 0;
      }
    }
    if(keyCode==LEFT) {
      for(int i = 0; i<numBallz; i++) {
        ballz[i].xAcc = accel;
        ballz[i].yAcc = 0;
        ballz[i].zAcc = 0;
      } 
    }
    if(keyCode==RIGHT) {
      for(int i = 0; i<numBallz; i++) {
        ballz[i].xAcc = -accel;
        ballz[i].yAcc = 0;
        ballz[i].zAcc = 0;
      } 
    }
  } else {
    if (key=='-') {
      for (int i = 0; i < ballz.length; i++) {
        ballz[i].setAcc(0, 0, accel);
      }
    } else if (key=='=') {
      for (int i = 0; i < ballz.length; i++) {
        ballz[i].setAcc(0, 0, -accel);
      }
    }
  }
}
class Ball { //Declaring class properties
  float x;
  float y;
  float z;
  int col;

  float xVel;
  float yVel;
  float zVel;
  float xAcc = 0;
  float yAcc = accel;
  float zAcc = 0;

  Ball(float xPos, float yPos, float zPos, int myColor) {
    this.x = xPos;
    this.y = yPos;
    this.z = zPos;
    this.col = myColor;
  }

  public void fall() { //Equations to make the ball fall
    this.x += this.xVel;
    this.xVel += this.xAcc;
    this.y += this.yVel;
    this.yVel += this.yAcc;
    this.z += this.zVel;
    this.zVel += this.zAcc;
    
    this.checkBounds();
  }

  public void show() { //...to show the ball
    //fill(col);
    //lights(); //Turns the lights on
    pushMatrix();
    translate(this.x, this.y, this.z);
    sphere(50);
    popMatrix();
  }
  
  public void checkBounds() {
     if((this.x > 450 && this.xVel > 0) 
        || (this.x < 50 && this.xVel < 0)) {
          
      this.xBounce(); 
    }
    
    if((this.y > 450 && this.yVel > 0) 
        || (this.y < 50 && this.yVel < 0)) {
      this.yBounce(); 
    }
    
    if ((this.z > 450 && this.zVel > 0)
        || (this.z < 50 && this.zVel < 0)) {
      this.zBounce();
    }
  }

  public void xBounce() { //...and to bounce the ball
    xVel *= .9f;
    xVel = -xVel;
  }

  public void yBounce() { //...and to bounce the ball
    yVel *= .9f;
    yVel = -yVel;
  }
  
  public void zBounce() { //...and to bounce the ball
    zVel *= .9f;
    zVel = -zVel;
  }
  
  public void setAcc(float x, float y, float z) {
    this.xAcc = x;
    this.yAcc = y;
    this.zAcc = z;
  }
}






class Pit {
  Ball ballz[];
  int siz;
  
  Pit(int s) {
    this.siz = s;
  }
  
  public void show() {
    pushMatrix();
    translate(siz/2, siz/2, 0);
    noFill();
    stroke(1);
    box(siz);
    noStroke();
    fill(1);
    popMatrix();
    
    //lights();
    for (int i = 0; i < ballz.length; i++) {
      ballz[i].fall();
      ballz[i].show();
    }
  }
}
  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#DFDFDF", "ball_pit" });
  }
}
