class Xp {
  
  float x, y, direction;
  float vx, vy, friction;
  float speed;
  PImage xp;
  Xp(float x, float y) {
  this.x=x;
  this.y=y;
  friction=0.1;
  vx=0;
  vy=0;
  xp = loadImage("exppixelRJ.png");
  }
  void display() {
  image(xp, x, y, 30, 30);
  
  }
  void move(float tx, float ty) {
    direction=atan2(ty-y,tx-x);
    vy+=sin(direction)*random(1);
    vx+=cos(direction)*random(1);
    x+=vx;
    //vx+=ax-((vx*friction));
    if (vx>0) {
      vx-=sqrt(vx)*friction;
    } else {
      vx+=sqrt(abs(vx))*friction;
    }
    //println(vy);
    y+=vy;
    if (vy>0) {
      vy-=sqrt(vy)*friction;
    } else {
      vy+=sqrt(abs(vy))*friction;
    }
  
  }
  boolean crash (float tx, float ty, int tsize) {
    if (dist(x,y,tx,ty)<tsize) {
    //if(abs(ty-y)<tsize & abs(tx-x)<tsize-size/2) {
      return true;
    } else {
    return false;
    }
  
  }
}
