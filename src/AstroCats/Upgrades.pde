class Upgrade {
  // Member Variables
  int x, y, dlvl, hlvl, slvl, flvl, plvl, rlvl, zlvl;
  char c;
  PImage d, h, s, f, p, r, z;
  color col;
  float t = random(4);
  float a = random(2);
  //int[] lvls=new int[7];

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
    z = loadImage("brownmouseRJ.png");
    col = #ffffff;
    dlvl = 1;
    hlvl = 1;
    slvl = 1;
    flvl = 1;
    plvl = 1;
    rlvl = 1;
    zlvl = 1;
  }

  // Memeber Methods
  void display () {
    imageMode(CENTER);
    rectMode(CENTER);
    fill(col);
    rect(x, y, 200, 300);
    fill(0);
    textAlign(CENTER, CENTER);
    switch (c) {
    case 'd':
      image(d, x, y, 300, 300);
      textSize(24);
      text("Damage Level " + dlvl, x, y-100);
      textSize(27);
      text("+7 Damage", x, y+100);
      break;
    case 'h':
      image(h, x-14, y-5, 170, 170);
      textSize(23);
      text("Health Level " + hlvl, x, y-100);
      textSize(27);
      text("+15 Max HP", x, y+100);
      break;
    case 's':
      image(s, x, y, 380, 380);
      textSize(23);
      text("Speed Level " + slvl, x, y-100);
      textSize(28);
      text("+3%", x, y+100);
      break;
    case 'f':
      image(f, x, y, 300, 300);
      textSize(22);
      text("Fire Rate Level " + flvl, x, y-100);
      textSize(28);
      text("+4%", x, y+100);
      break;
    case 'p':
      image(p, x, y, 170, 170);
      textSize(20);
      text("Shot Velocity Level " + plvl, x, y-100);
      textSize(28);
      text("+30%", x, y+100);
      break;
    case 'r':
      image(r, x, y, 140, 140);
      textSize(22);
      text("Health Regen Level " + rlvl, x, y-100);
      textSize(26);
      text("+.6 HP/s", x, y+100);
      break;
    case 'z':
      image(z, x, y, 400, 400);
      textSize(24);
      text("Shot Size Level " + zlvl, x, y-100);
      textSize(26);
      text("+4%", x, y+100);
      break;
    default:
      break;
    }
    fill(0, 0, 255);
  }

  boolean hover() {
    if (mouseX < x+100 && mouseX > x-100 && mouseY < y+150 && mouseY > y-150) {
      col = #d6d6d6;
      return true;
    } else col = #ffffff;
    return false;
  }
}
