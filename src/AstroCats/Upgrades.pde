class Upgrade {
  // Member Variables
  int x, y, dlvl, hlvl, slvl;
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
    dlvl = 1;
    hlvl = 1;
    slvl = 1;
  }

  // Memeber Methods
  void display () {
    imageMode(CENTER);
    d.resize(50, 50);
    h.resize(70, 70);
    s.resize(150, 150);
    rectMode(CENTER);
    fill(col);
    rect(x, y, 100, 150);
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(11);
    if (c == 'd') {
      image(d, x, y);
      text("Damage Level " + dlvl, x, y-40);
      text("+1", x, y+35);
    }
    if (c == 'h') {
      image(h, x-5, y-5);
      text("Health Level " + hlvl, x, y-40);
      text("+1", x, y+35);
    }
    if (c == 's') {
      image(s, x, y);
      text("Speed Level " + slvl, x, y-40);
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
