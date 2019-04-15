
class AlienOnUFO{
  PVector loc;
  PImage alien, UFO;
  int resizeA, resizeUFO;
  float power;
  ArrayList<Bullet> bullets;
  ArrayList<Planets> planets;
  ArrayList<Moons> moons;
  int score;
  
  
  AlienOnUFO(PImage alien, PImage UFO, float power, ArrayList<Planets> p, ArrayList<Moons> m){
    this.alien = alien; 
    this.UFO = UFO;
    this.loc = new PVector(width/2,height/2);
    
    this.resizeA = 14;
    this.resizeUFO = 8;
    // change the acceleration of every bullet
    this.power = power;
    
    this.bullets = new ArrayList();
    this.planets = p;
    this.moons = m;
    
    this.score = 0;
  }

  void updateLoc(){
    float x = constrain(mouseX,width/2-50,width/2+50);
    float y = constrain(mouseY,height/2-50,height/2+50);
    this.loc = new PVector(x,y);
  }
  
  void display(float rotateAmt){
    pushMatrix();
    translate(loc.x,loc.y);
    rotate(rotateAmt*TWO_PI/360);
    image(alien,0,0,alien.width/resizeA,alien.height/resizeA);
    popMatrix();
    image(UFO,loc.x,loc.y+20,UFO.width/resizeUFO,UFO.height/resizeUFO);
    fill(255);
    
    textFont(font);
    text("Score: "+score,80,100);
    text("Time: " +((millis()-initTime)/1000),80,140);
  }

  void shoot(){
    bullets.add(new Bullet(loc,power));
  }
  

  boolean bulletMove(){
    boolean re = false;
    for(Bullet bu:bullets){
      if(bu.target == "none"){
        bu.move();
        bu.display();
      }
      else{
        bu.blast(bu.loc);
        re = true;
      }
    }
    return re;
  }
  
  void score(){
    // looking for appropriate sound to the effect
    for(Bullet bu:bullets){
      if(bu.target == "none"){
        if(earth.isHit(bu)){
          score += 1;
          bu.target = "earth";
        }
        if(mars.isHit(bu)){
          score += 3;
          bu.target = "mars";
        } 
        if(e1.isHit(bu)){
          score += 5;
          bu.target = "e1";
        }
        if(m1.isHit(bu)){
          score += 10;
          bu.target = "m1";
        }
        if(m2.isHit(bu)){
          score += 10;
          bu.target = "m2";
        }
      }
    }
  }
  

}