
import processing.sound.*;

PImage img;
PImage sun;
PImage imgEarth;
PImage imgMars;
PImage imgMoon;
ArrayList<Planets> p;
ArrayList<Moons> m;

int rotateAmt;
boolean towardRight;

PImage alien;
PImage UFO;
PShape bullet;
PVector loc;

String dir;
PFont font;

float initTime;

SoundFile blast_eff;
AlienOnUFO purple;
Planets earth, mars;
Moons e1, m1, m2;

void setup(){
  surface.setResizable(true);
  img = loadImage("space.jpg");
  surface.setSize(img.width, img.height); //760 x 680
  smooth();
  frameRate(30);
  ellipseMode(CENTER);
  shapeMode(CENTER);
  
 
  //set up Planets
  imgEarth = loadImage("Earth_img.png");
  imgMars = loadImage("Mars_img.png");
  earth = new Planets(imgEarth, 150, 10, 2, color(#056FFF));
  mars = new Planets(imgMars, 300, 5, 1, color(#E50B00));
  
  //set up Moons
  imgMoon = loadImage("moon.png");
  e1 = new Moons(imgMoon,width/2, height/2, 50, 5, 5,3);
  m1 = new Moons(imgMoon,width/2, height/2, 35, 3, 10,3);
  m2 = new Moons(imgMoon,width/2, height/2, 45, 5, 8,3);
  
  p = new ArrayList();
  p.add(earth);
  p.add(mars);
  
  m = new ArrayList();
  m.add(e1);
  m.add(m1);
  m.add(m2);
  
  // set up alien
  alien = loadImage("Alien.png");
  UFO = loadImage("UFO.png");
  
  // create shape for bullets
  bullet = createShape(RECT,0,0,30,5);
  bullet.setFill(color(255));
  bullet.setStroke(false);
  
  purple = new AlienOnUFO(alien,UFO,10,p,m);
  rotateAmt = -15;
  
  // create font for text on the screen
  font = createFont("Comic Sans MS Bold",24);
  
  // import blast sound effect
  blast_eff = new SoundFile(this,"blast.wav");
  
}

void draw(){
  //set up background
  image(img, 0,0);

  //set up sun
  noStroke();
  fill(#FFB005, 50);
  ellipse(381, 340, 100, 100);
  sun = loadImage("Sun_img.png");
  image(sun,343,303,75,75);  

 
  //animate planets and display planets
  earth.move();
  earth.display();
  
  mars.move();
  mars.display();
  
  //animate moons and display moons
  e1.xcenter = earth.x;
  e1.ycenter = earth.y;
  e1.orbit();
  e1.display();
  
  m1.xcenter = mars.x;
  m1.ycenter = mars.y;
  m1.orbit();
  m1.display();
  
  m2.xcenter = mars.x;
  m2.ycenter = mars.y;
  m2.orbit();
  m2.display();
  
  
  imageMode(CENTER);
  if(towardRight){
    rotateAmt++;
  }
  else{
    rotateAmt--;
  }
  if(rotateAmt > 15){
    towardRight = false;
  }
  else if(rotateAmt < -15){
    towardRight = true;
  }
  purple.display(rotateAmt);
  purple.updateLoc();
  purple.bulletMove();
  purple.score();
  imageMode(CORNER);
}

void mouseClicked(){
  purple.shoot();
}