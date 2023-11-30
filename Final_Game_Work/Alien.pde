class Alien {
  int x;
  int y;
  int w;
  int h;

  int left;
  int right;
  int top;
  int bottom;

  Alien(int startingX, int startingY, int startingW, int startingH) {
    x=startingX;
    y=startingY;
    w=startingW;
    h=startingH;

    left=x-w/2;
    right=x+w/2;
    top=y-h/2;
    bottom=y+h/2;
  }
  void render() {
    rectMode(CENTER);
    rect(x, y, w, h);
  }
  void collision(ArrayList<Player> aPlayerList) {
    for (Player aPlayer : aPlayerList) {
      println(aPlayer.top);
      println(aPlayer.bottom);
      println(" ");
      if (top<=aPlayer.bottom &&
        bottom>=aPlayer.top &&
        left<=aPlayer.right &&
        right>=aPlayer.left) {
        println("Alien hit");
        aPlayer.x=width/2;
        aPlayer.y=height/2;
      }
    }
  }
}
