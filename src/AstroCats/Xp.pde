class Xp {
  
  float x, y, direction;

  Xp(float x, float y) {
  this.x=x;
  this.y=y;
  }
  void display() {
  rect(x,y,10,10);
  
  }
  void move(float tx, float ty) {
    direction=atan2(tx-x,ty-y);
    y+=sin(direction);
    x+=cos(direction);
  
  }
}
