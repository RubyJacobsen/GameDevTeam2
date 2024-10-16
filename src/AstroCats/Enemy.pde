class Enemy {
  float x, y, a;
  int hp, d;


  Enemy(float ex, float ey) {
  x = ex;
    y = ey;
  }

  void display(float px, float py) {
    pushMatrix();
    translate(x, y);
    rotate(atan2(y-py, x-px));
    fill(0, 0, 255); 
    ellipse(0, 0, 60, 30);
    fill(255);
    popMatrix();
  }

  void death() {
  }

  void aggro() {
  }

  void move() { 
    y+=1;
    x+=2;
  }

  void hit () {
  }
}
