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
    d.resize(70, 70);
    h.resize(90, 90);
    s.resize(190, 190);
    rectMode(CENTER);
    fill(col);
    rect(x, y, 100, 150);
    fill(0);
    textAlign(CENTER, CENTER);
    if (c == 'd') {
      image(d, x, y);
      textSize(13);
      text("Damage Level " + dlvl, x, y-50);
      textSize(15);
      text("+5 Damage", x, y+50);
    }
    if (c == 'h') {
      image(h, x-7, y-5);
      textSize(14);
      text("Health Level " + hlvl, x, y-50);
      textSize(15);
      text("+5 HP", x, y+50);
    }
    if (c == 's') {
      image(s, x, y);
      text("Speed Level " + slvl, x, y-50);
      text("+1 m/s", x, y+50);
    }
    fill(0, 0, 255);
  }

  boolean hover() {
    if (mouseX < x+50 && mouseX > x-50 && mouseY < y+75 && mouseY > y-75) {
      col = #d6d6d6;
      return true;
    }
    else col = #ffffff;
    return false;
  }
}
