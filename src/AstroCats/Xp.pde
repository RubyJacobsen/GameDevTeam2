class Xp {
  
  float x, y, direction;
  float vx, vy, friction;

  Xp(float x, float y) {
  this.x=x;
  this.y=y;
  friction=0.1;
  vx=random(-1,1);
  vy=random(-1,1);
  }
  void display() {
  rect(x,y,10,10);
  
  }
  void move(float tx, float ty) {
    direction=atan2(ty-y,tx-x);
    vy+=sin(direction)*random(0,1);
    vx+=cos(direction)*random(0,1);
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
