class Moons {
  float xcenter;
  float ycenter;
  float rad;
  float orbR;
  float orbSpeed;
  float theta;
  float x,y;
  PImage img;
  int size;
  
  //constructor
  Moons(PImage _img,float _xcenter,float _ycenter, int _orbR, float _rad, float _orbSpeed, int _s) {
    xcenter = _xcenter; 
    ycenter = _ycenter;
    rad = _rad;
    orbR = _orbR;
    x = 0; 
    y = 0;
    theta = 0;
    orbSpeed = _orbSpeed;
    img = _img;
    size = _s;
  }
  
  void display(){
    //noStroke();
    //fill(#29FF00);
    //ellipse(x,y,rad,rad);
    image(img, x, y, rad*size, rad*size);
    
  }
  
  void orbit(){
    theta += radians(orbSpeed);
    x = xcenter + cos(theta)*orbR;
    y = ycenter +sin(theta)*orbR;
  }
  
    
  boolean isHit(Bullet bu){
    boolean re = false;
    if(abs(bu.loc.x-x) < rad*size && abs(bu.loc.y-y) < rad*size){
      re = true;
    }
    return re;
  }
  
}