//My submission achieves having a player that can jump on platforms as well as interacts with an enemy and I have a planet in place. There is also background music and

import processing.sound.*;

SoundFile jumping;
SoundFile bgMusic;
//declare vars
Player p1;

Platform plat1;
Platform plat2;
Platform plat3;

Alien a1;

Planet plan1;

ArrayList<Platform>platformList;

ArrayList<Player>aPlayerList;

ArrayList<Planet>PlanetList;

PImage starImg;
PImage startImg;
boolean started=false;


int state=0;

int startTime;
int endTime;
int interval=8500;

Animation alienAnimation;
PImage[] alienImages=new PImage[2];
PImage enemyImg;


Animation astronautAnimation;
PImage[] astronautImages=new PImage[2];
PImage astronautImg;

Animation planetAnimation;
PImage[] planetImages=new PImage[2];
PImage planetImg;

void setup() {
  size(800, 600);
  //initialize vars
  p1= new Player(width/2, height/2, 50, 50);

  plat1= new Platform(610, 550);
  plat2= new Platform(185, 470);
  plat3= new Platform(600, 380);

  platformList= new ArrayList<Platform>();

  platformList.add(plat1);
  platformList.add(plat2);
  platformList.add(plat3);

  aPlayerList=new ArrayList<Player>();

  jumping= new SoundFile(this, "jump.wav");
  bgMusic= new SoundFile(this, "spaceFun.wav");

  a1= new Alien(630, 330, 70, 70);

  aPlayerList.add(p1);

  printArray(aPlayerList);

  PlanetList= new ArrayList<Planet>();

  plan1= new Planet(540, 337);

  PlanetList.add(plan1);


  starImg= loadImage("Star Background.jpeg");
  starImg.resize(starImg.width, starImg.height);

  startImg= loadImage("Start Screen.jpeg");
  startImg.resize(startImg.width*(2), startImg.height*(2));

  imageMode(CENTER);

  startTime= millis();
  
  enemyImg= loadImage("enemy0.png");
  enemyImg.resize(enemyImg.width/2,enemyImg.height/2);
  
  astronautImg= loadImage("astronaut0.png");
  astronautImg.resize(astronautImg.width/2, astronautImg.height/2);
  
  planetImg= loadImage("planet0.png");
  planetImg.resize(planetImg.width, planetImg.height);
  imageMode(CENTER);
  //loop to fill my array
  for(int index=0; index < 2; index ++){
    alienImages[index]= loadImage("enemy" + index+ ".png");
  }
  for(int index=0; index < 2; index ++){
    astronautImages[index]= loadImage("astronaut" + index+ ".png");
  }
  for(int index=0; index < 2; index ++){
    planetImages[index]= loadImage("planet" + index+ ".png");
  }
  
  astronautAnimation= new Animation(astronautImages, 0.06, 1.6);
  
  alienAnimation=new Animation(alienImages,0.06, 1.2);
  
  planetAnimation= new Animation(planetImages, 0.06, 0.06);
}

void draw() {
  background(42);
  image(starImg, width/2, height/2);
  rectMode(CENTER);
  switch(state) {
    //first state
  case 0:
    background(0);
    image(startImg, width/2, height/2);
    rectMode(CENTER);
    fill(255);
    textSize(70);
    text("Press ENTER to Start", 70, height/2);
    break;

  case 1:
    fill(255);
    textSize(70);
    text("Level 1", 70, height/2);
    endTime=millis();
    p1.render();
    p1.move();
    p1.jumping();
    p1.falling();
    p1.topOfJump();
    p1.land();
    p1.fallOffPlatform(platformList);

    if (!bgMusic.isPlaying()) {
      bgMusic.play();
      bgMusic.amp(0.3);
    }
   // println(p1.top);

    for (Platform aPlatform : platformList) {
      aPlatform.render();
      aPlatform.collide(p1);
    }

    for (Planet aPlanet : PlanetList) {
      planetAnimation.display(aPlanet.x, aPlanet.y);
      planetAnimation.isAnimating = true;
      //aPlanet.render();
      aPlanet.collision(aPlayerList);
      aPlanet.move();
      aPlanet.land();
      aPlanet.falling();
      aPlanet.fallOffPlatform(platformList);
    }

    a1.collision(aPlayerList);
    //a1.render();
    
    alienAnimation.display(a1.x, a1.y);
   rectMode(CENTER);
   alienAnimation.isAnimating=true;
   
   astronautAnimation.display(p1.x,p1.y);
   
    if (endTime-startTime>=interval) {
      //println("timer triggered");

      PlanetList.add(new Planet(540,337));
      startTime=millis();
      //println("case 1");
    }
    println("case 1");
    break;
    
  case 2:
    fill(255);
    textSize(70);
    text("Level 2", 70, height/2);
    endTime=millis();
    p1.render();
    p1.move();
    p1.jumping();
    p1.falling();
    p1.topOfJump();
    p1.land();
    p1.fallOffPlatform(platformList);

    if (!bgMusic.isPlaying()) {
      bgMusic.play();
      bgMusic.amp(0.3);
    }
   // println(p1.top);

    for (Platform aPlatform : platformList) {
      aPlatform.render();
      aPlatform.collide(p1);
    }

    a1.collision(aPlayerList);
    //a1.render();

   for (Planet aPlanet : PlanetList) {
    planetAnimation.display(aPlanet.x, aPlanet.y);
    planetAnimation.isAnimating=true;
    aPlanet.collision(aPlayerList);
    aPlanet.move();
    aPlanet.land();
    aPlanet.falling();
    aPlanet.fallOffPlatform(platformList);
    aPlanet.dx=4;
    aPlanet.dy=4;
   }
    
   alienAnimation.display(a1.x, a1.y);
   rectMode(CENTER);
   alienAnimation.isAnimating=true;
   
   astronautAnimation.display(p1.x,p1.y);
    println("case 2");
    break;
   
 case 3:
    fill(255);
    textSize(70);
    text("Level 3", 70, height/2);
    endTime=millis();
    p1.render();
    p1.move();
    p1.jumping();
    p1.falling();
    p1.topOfJump();
    p1.land();
    p1.fallOffPlatform(platformList);

    if (!bgMusic.isPlaying()) {
      bgMusic.play();
      bgMusic.amp(0.3);
    }
   // println(p1.top);

    for (Platform aPlatform : platformList) {
      aPlatform.render();
      aPlatform.collide(p1);
    }

    a1.collision(aPlayerList);
   // a1.render();

    for (Planet aPlanet : PlanetList) {
    planetAnimation.display(aPlanet.x, aPlanet.y);
    aPlanet.collision(aPlayerList);
    aPlanet.move();
    aPlanet.land();
    aPlanet.falling();
    aPlanet.fallOffPlatform(platformList);
    aPlanet.dx=5;
    aPlanet.dy=5;
    }
   alienAnimation.display(a1.x, a1.y);
   rectMode(CENTER);
   alienAnimation.isAnimating=true;
   
   astronautAnimation.display(p1.x,p1.y);
    println("case 3");
    break;

  case 4:
   background(0);
    image(startImg, width/2, height/2);
    rectMode(CENTER);
    fill(255);
    textSize(50);
    text("CONGRATULATIONS YOU WIN!!!:)", 70, height/2);
    break;
  }
    if (a1.top <= p1.bottom && 
    a1.bottom >= p1.top && 
    a1.right >= p1.left && 
    a1.left <= p1.right &&
    state != 4){
    state++;
    }
}

void keyPressed() {
  if (key=='a') {
    p1.isMovingLeft=true;
  }
  if (key=='d') {
    p1.isMovingRight=true;
  }
  if (key=='w' && p1.isJumping==false && p1.isFalling==false) {
    p1.isJumping=true;
    p1.highestY= p1.y-p1.jumpHeight;
    jumping.play();
  }
  if (keyCode == ENTER) {
    if (state==0) {
      state=1;
    } else if (state==1) {
      state=0;
    }
  }
}
void keyReleased() {
  if (key=='a') {
    p1.isMovingLeft=false;
  }
  if (key=='d') {
    p1.isMovingRight=false;
  }
}
