class Asteroid extends Enemy {
  int m;
  PImage a1, a2, a3;
  Asteroid(float x, float y, int hp) {
    super(x, y, hp);
    a1 = loadImage("astroid1RJ.png");
    a2 = loadImage("asteroid2RJ.png");
    a3 = loadImage("asteroid3RJ.png");
  }
  void display() {
    m=millis();
    pushMatrix();
    translate(x, y);
    rotate(radians(m/50));
    fill(255, 0, 0);
    if (e<1) {
      image(a3, 0, 0, size*1.5, size*1.5);
    } else if (e < 2) {
      image(a2, 0, 0, size*1.5, size*1.5);
    } else if (e < 1) {
      image(a1, 0, 0, size*1.5, size*1.5);
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
}
