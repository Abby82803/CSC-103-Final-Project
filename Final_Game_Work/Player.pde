class Player{
  //variables
  int x;
  int y;
  
  int w;
  int h;
  
  boolean isMovingLeft;
  boolean isMovingRight;
  
  boolean isJumping;
  boolean isFalling;
  
  int speed;
  
  int jumpHeight;//distance to jump upward
  int highestY;//y value at top of jump
  
  int left;
  int right;
  int top;
  int bottom;
  
  //constructer
  Player(int startingX, int startingY, int startingW, int startingH){
    x=startingX;
    y=startingY;
    w=startingW;
    h=startingH;
    
   isMovingLeft=false;
   isMovingRight=false;
   
   isJumping=false;
   isFalling=false;
   speed=10;
   
   jumpHeight=100;
   highestY= y-jumpHeight;
   
    left=x-w/2;
    right=x+w/2;
    top=y-h/2;
    bottom=y+h/2;
  }
  //functions
  void render(){
    rectMode(CENTER);
    rect(x,y,w,h);
  }
  void move(){
    if(isMovingLeft==true){
      x-=speed;
    }
    if(isMovingRight==true){
      x+=speed;
    }
    left=x-w/2;
    right=x+w/2;
    top=y-h/2;
    bottom=y+h/2;
  }
void jumping(){
  if (isJumping==true){
    y-=speed;
  }
 }
 void falling(){
   if(isFalling==true){
     y+=speed;
   }
 }
void topOfJump(){
  if(y<=highestY){
    isJumping=false;
    isFalling=true;
  }
 }
 void land(){
   if(y>=height-h/2){
     isFalling=false;
     y=height-h/2;
   }
  }
  void fallOffPlatform(ArrayList<Platform> aPlatformList){
    if(isJumping==false&&y<height-h/2){
      boolean onPlatform= false;
      
     for(Platform aPlatform: aPlatformList){
       if(top<=aPlatform.bottom &&
       bottom>=aPlatform.top &&
       left<=aPlatform.right &&
       right>=aPlatform.left){
         onPlatform=true;
       }
     }
       if(onPlatform==false){
         isFalling=true;
     }
    }
  }
}
