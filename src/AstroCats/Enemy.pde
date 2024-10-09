class enemy {
  float x, y, a;
  int hp, d;
  
  enemy(float ex, float ey) {
    this.x = ex;
    this.y = ey;
  }
  
  void display() {
    ellipse(x,y,50,35);
    
  }
  
  void death() {}
  
  void aggro() {}
  
  void move() {}
  
  void hit () {}
  
}
