class Upgrade {
  // Member Variables
  int x, y;
  char c;
  PImage d, h;

  // Constructor
  Upgrade(int x, int y, char c) {
    this.x=x;
    this.y=y;
    this.c = c;
    d = loadImage("tunainspace.png");
    h = loadImage("catnip.png");
  }

  // Memeber Methods
  void display () {
    imageMode(CENTER);
    d.resize(50,50);
    h.resize(70,70);
    rectMode(CENTER);
    fill(255);
    rect(x,y,75,125);
    fill(0);
    if (c == 'd') {
      image(d, x, y);
      textAlign(CENTER,CENTER);
      textSize(18);
      text("Damage", x, y-40);
      text("+1", x, y+35);
    }
    if (c == 'h') {
      image(h,x-5,y-5);
      textAlign(CENTER,CENTER);
      textSize(18);
      text("Health", x, y-40);
      text("+1", x, y+35);
    }
    fill(0,0,255);
  }

  void hover () {
  }
}
