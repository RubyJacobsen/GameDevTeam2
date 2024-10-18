class Enemy {
  float x, y;
  int hp, d;
  int size=45;
  float sx = random(10, 15);
  float sy = random(10, 15);

   Enemy(float ex, float ey, int h) {
  x = ex;
    y = ey;
    hp=h;
  }
  void display(float px, float py) {
    pushMatrix();
    translate(x, y);
    rotate(atan2(y-py, x-px));
    fill(255, 0, 0); 
    ellipse(0, 0, size*1.5, size/1.5);
    fill(255);
    popMatrix();
  }

  void death() {
  }

  void move(float vx, float vy, boolean r) { 
    if (r == true) {
      x += vx;
      y += vy;
    }
    else {
      x -= vx;
      y -= vy;
    }
  }

  void hit () {
  }
}
