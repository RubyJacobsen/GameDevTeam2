class Enemy {
  float x, y, a;
  int hp, d;
  int size=45;


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

  void aggro() {
  }

  void move() { 
    //y+=1;
    //x+=2;
  }

  void hit () {
  }
}
