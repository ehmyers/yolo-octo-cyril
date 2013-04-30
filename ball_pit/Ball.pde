class Ball { //Declaring class properties
  float x;
  float y;
  float z;
  color col;

  float xVel;
  float yVel;
  float zVel;
  float xAcc = 0;
  float yAcc = accel;
  float zAcc = 0;

  Ball(float xPos, float yPos, float zPos, color myColor) {
    this.x = xPos;
    this.y = yPos;
    this.z = zPos;
    this.col = myColor;
  }

  void fall() { //Equations to make the ball fall
    this.x += this.xVel;
    this.xVel += this.xAcc;
    this.y += this.yVel;
    this.yVel += this.yAcc;
    this.z += this.zVel;
    this.zVel += this.zAcc;
    
    this.checkBounds();
  }

  void show() {
    fill(col);
    pushMatrix();
    translate(this.x, this.y, this.z);
    sphere(50);
    popMatrix();
  }
  
  void checkBounds() {
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

  void xBounce() { //...and to bounce the ball
    xVel *= .9;
    xVel = -xVel;
  }

  void yBounce() { //...and to bounce the ball
    yVel *= .9;
    yVel = -yVel;
  }
  
  void zBounce() { //...and to bounce the ball
    zVel *= .9;
    zVel = -zVel;
  }
  
  void setAcc(float x, float y, float z) {
    this.xAcc = x;
    this.yAcc = y;
    this.zAcc = z;
  }
  
  void flipDirection() {
    this.xVel = -0.9*this.xVel;
    this.yVel = -0.9*this.yVel;
    this.zVel = -0.9*this.zVel;
  }
  
  void move(int n) {
    this.x += this.xAcc * n;
    this.y += this.yAcc * n;
    this.z += this.zAcc * n;
  }
}

