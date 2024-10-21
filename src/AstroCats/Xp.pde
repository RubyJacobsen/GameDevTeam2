float tx, ty;


class Xp extends Player {
  Xp(float x, float y) {
  super(x,y);
  tx=x;
  ty=y;
  }
  void display() {
  rect(x,y,10,10);
  
  }
}
