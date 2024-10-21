class Enemy {
  float x, y, a;
  int hp, d, mhp;
  int size=45;
  PImage e1, e2;
  float e = random(0,2);

  Enemy(float ex, float ey, int h) {
    x = ex;
    y = ey;
    hp=h;
    mhp=h;
    e1 = loadImage("Alien1GH.png");
    e2 = loadImage("Alien2GH.png");
    e = random(0,2);
  }
  void display(float px, float py) {
    pushMatrix();
    translate(x, y);
    rotate(atan2(y-py, x-px));
    fill(255, 0, 0);
    if (e<1) {
      image(e1, 0, 0, size*1.5, size*1.5);
    } else if (e < 2) {
      image(e2, 0, 0, size*1.5, size*1.5);
    }
    
    popMatrix();
    if (hp<mhp) {
      rectMode(CENTER);
      strokeWeight(10);
      fill(0);
      rect(x, y-size, size*1.3, 10);
      fill(255, 50, 50);
      strokeWeight(0);
      rectMode(CORNER);
      rect(x-(size*1.3*0.5), y-size-5, float(hp)/float(mhp)*size*1.3, 10);
      strokeWeight(1);
    }
  }

  void death() {
  }

  void aggro() {
  }

  void move() {
    //y+=1;
    //x+=2;
  }

  void hit () {
  }
}
