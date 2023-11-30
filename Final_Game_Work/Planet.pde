class Planet {
  int x;
  int y;
  int d;

  int left;
  int right;
  int top;
  int bottom;

  boolean isMovingRight;
  int dx;
  int dy;
  int speed;

  boolean isFalling;

  Planet(int startingX, int startingY) {
    x=startingX;
    y=startingY;
    d=55;

    left=x-d/2;
    right=x+d/2;
    top=y-d/2;
    bottom=y+d/2;

    isMovingRight=false;
    isFalling=true;

    speed=2;
    dx=2;
    dy=5;
  }
  void render() {
    circle(x, y, d);
  }

  void collision(ArrayList<Player> aPlayerList) {
    for (Player aPlayer : aPlayerList) {
      if (top<=aPlayer.bottom &&
        bottom>=aPlayer.top &&
        left<=aPlayer.right &&
        right>=aPlayer.left) {
        println("Planet collision");
        aPlayer.x = width/2;
        aPlayer.y = height/2;
      }
    }
  }

  void falling() {
    if (isFalling==true) {
      y+=speed;
    }
  }
  void land() {
    if (y>=height-d/2) {
      isFalling=false;
      x=550;
      y=337;
    }
  }
  void move() {
    left=x-d/2;
    right=x+d/2;
    top=y-d/2;
    bottom=y+d/2;

    // change direction if statements
    if (x>=530) {
      isMovingRight=false;
    }
    if (x<=100) {
      isMovingRight=true;
    }
    if (isMovingRight==true) {
      x+=dx;
    }
    if (isMovingRight==false) {
      x-=dx;
    }
  }

  void fallOffPlatform(ArrayList<Platform> aPlatformList) {


    //if (isFalling==true&&y<height-d/2) {
    println("test");
    boolean onPlatform= false;

    for (Platform aPlatform : aPlatformList) {
      if (top<=aPlatform.bottom &&
        bottom>=aPlatform.top &&
        left<=aPlatform.right &&
        right>=aPlatform.left) {
        onPlatform=true;
      }
    }
    if (onPlatform==false) {
      isFalling=true;
      println("start fallng");
    } else {
      isFalling=false;
    }
  }
  //}
}
