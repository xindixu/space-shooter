

class Bullet{
  PVector loc,vel,acc,temp,dir,terminal;
  PShape shape;
  PVector locOfUFO;
  float ang,power;
  String target;
  PImage blast;
  PVector trans = new PVector(width/2,height/2);
  int cnt;

  
  Bullet(PVector locOfUFO, float power){
    this.locOfUFO = locOfUFO;
    this.loc = locOfUFO.copy(); 
    
    this.power = power;
    this.temp = new PVector(mouseX,mouseY);
    this.dir = temp.sub(trans);
    
    
    // initialize the acceleration at a random direction with a defined power
    this.ang = dir.heading();
    this.acc = new PVector(power,0);
    pushMatrix();
    this.acc.rotate(ang);
    popMatrix();
    
    this.vel = new PVector(0,0);
 
    this.shape = new PShape();
    shape = createShape(RECT,0,0,30,5);
    shape.setFill(color(255));
    shape.setStroke(false);
    pushMatrix();
    shape.rotate(ang);
    popMatrix();
    
    this.blast = loadImage("explosion.png");
    
    this.target = "none";
    this.cnt = 0;
  }
  
  void move(){
    loc.add(vel);
    vel.add(acc);
  }
    
  void display(){
    if(target == "none"){
      shape(shape,loc.x,loc.y);
    }
  }
  
  void blast(PVector pos){
    int size = 10;
    if(target == "earth"){
      size = 100;
    }
    if(target == "mars"){
      size = 50;
    }
    if(target == "e1"){
      size = 20;
    }
    if(target == "m1" || target == "m2"){
      size = 10;
    }
    if(cnt < 5){
      cnt++;
      image(blast,pos.x,pos.y,size,size);
      blast_eff.play();
    }

  }
  


}