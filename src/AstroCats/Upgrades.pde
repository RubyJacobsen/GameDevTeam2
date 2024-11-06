class Upgrade {
  // Member Variables
  int x, y, dlvl, hlvl, slvl, flvl, plvl, rlvl;
  char c;
  PImage d, h, s, f, p, r;
  color col;
  float t = random(4);
  float a = random(2);

  // Constructor
  Upgrade(int x, int y, char c) {
    this.x=x;
    this.y=y;
    this.c = c;
    d = loadImage("projectileRJ.png");
    h = loadImage("catnip.png");
    s = loadImage("cucumber.png");
    f = loadImage("yarnball.png");
    p = loadImage("FirecatbowlEH.png");
    r = loadImage("tunainspace.png");
    col = #ffffff;
    dlvl = 1;
    hlvl = 1;
    slvl = 1;
    flvl = 1;
    plvl = 1;
    rlvl = 1;
  }

  // Memeber Methods
  void display () {
    imageMode(CENTER);
    rectMode(CENTER);
    fill(col);
    rect(x, y, 100, 150);
    fill(0);
    textAlign(CENTER, CENTER);
    if (c == 'd') {
      image(d, x, y, 170, 170);
      textSize(13);
      text("Damage Level " + dlvl, x, y-50);
      textSize(15);
      text("+7 Damage", x, y+50);
    }
    if (c == 'h') {
      image(h, x-7, y-5, 90, 90);
      textSize(14);
      text("Health Level " + hlvl, x, y-50);
      textSize(15);
      text("+5 HP", x, y+50);
    }
    if (c == 's') {
      image(s, x, y, 190, 190);
      text("Speed Level " + slvl, x, y-50);
      textSize(17);
      text("+3%", x, y+50);
    }
    if (c == 'f') {
      image(f, x, y, 150, 150);
      textSize(13);
      text("Fire Rate Level " + flvl, x, y-50);
      textSize(17);
      text("+4%", x, y+50);
    }
    if (c == 'p') {
      image(p, x, y, 85, 85);
      textSize(13);
      text("Shot Velocity Level " + plvl, x, y-50);
      textSize(17);
      text("+30%", x, y+50);
    }
    if (c == 'r') {
      image(r, x, y, 70, 70);
      textSize(13);
      text("Healh Regen Level " + rlvl, x, y-50);
      textSize(15);
      text("more", x, y+50);
    }
    fill(0, 0, 255);
  }

  boolean hover() {
    if (mouseX < x+50 && mouseX > x-50 && mouseY < y+75 && mouseY > y-75) {
      col = #d6d6d6;
      return true;
    } else col = #ffffff;
    return false;
  }
}
