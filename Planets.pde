class Planets {
  float radius = 5;
  float obrad;
  float orbitSpeed;
  float theta;
  float x;
  float y;
  color c;
  int size;
  PImage img;
  
  Planets(PImage _img, int _obrad, int _s, float _orbitSpeed, color _c){ 
    this.size = _s;
    this.obrad = _obrad;
    this.x = 0; 
    this.y = 0;
    this.theta = 0;
    this.orbitSpeed = _orbitSpeed;
    this.c = _c;
    this.img = _img;
  }

  void display()
  {
    float rotationSpeed = .001;
    float rotationAmt = millis()* rotationSpeed;
    pushMatrix();
    translate(x, y);
    rotate(rotationAmt);
    image(img, -img.width/8, -img.height/8, radius*size, radius*size);
    popMatrix();
  }

  void move()
  {
    theta += radians(orbitSpeed);
    x = 380 + cos(theta)*obrad;
    y = 340 + sin(theta)*obrad;
  }
  
  boolean isHit(Bullet bu){
    boolean re = false;
    if(abs(bu.loc.x-x) < radius*size && abs(bu.loc.y-y) < radius*size){
      re = true;
    }
    return re;
  }
}