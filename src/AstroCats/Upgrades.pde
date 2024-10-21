class Upgrade {
  // Member Variables
  int x, y;
  char c;
  PImage d, h, s;
  color col;

  // Constructor
  Upgrade(int x, int y, char c) {
    this.x=x;
    this.y=y;
    this.c = c;
    d = loadImage("tunainspace.png");
    h = loadImage("catnip.png");
    s = loadImage("cucumber.png");
    col = #ffffff;
  }

  // Memeber Methods
  void display () {
    imageMode(CENTER);
    d.resize(50, 50);
    h.resize(70, 70);
    s.resize(150, 150);
    rectMode(CENTER);
    fill(col);
    rect(x, y, 75, 125);
    fill(0);
    if (c == 'd') {
      image(d, x, y);
      textAlign(CENTER, CENTER);
      textSize(18);
      text("Damage", x, y-40);
      text("+1", x, y+35);
    }
    if (c == 'h') {
      image(h, x-5, y-5);
      textAlign(CENTER, CENTER);
      textSize(18);
      text("Health", x, y-40);
      text("+1", x, y+35);
    }
    if (c == 's') {
      image(s, x, y);
      textAlign(CENTER, CENTER);
      textSize(18);
      text("Speed", x, y-40);
      text("+1", x, y+35);
    }
    fill(0, 0, 255);
  }

  void hover() {
    if (mouseX < x+38 && mouseX > x-38 && mouseY < y+62 && mouseY > y-62) {
      col = #d6d6d6;
    }
    else col = #ffffff;
  }
}
