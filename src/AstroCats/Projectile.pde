class Projectile {
  boolean f;
  float x, y, speed, direction;
  int damage, size;
  color c;
  Projectile(boolean f, float x, float y, float speed, float direction, int damage, int size) {
    this.f=f;
    this.x=x;
    this.y=y;
    this.speed=speed;
    this.direction=direction;
    this.damage=damage;
    this.size=size;

    if (f) {
      c=#0000FF;
    } else {
      c=#FF0000;
    }
  }
  void display() {
    fill (c);
    pushMatrix();
    rectMode(CENTER);
    translate(x, y);
    rotate(direction);
    rect(0, 0, size, size/4);
    popMatrix();
  }
  void move() {
    y+=sin(direction)*speed;
    x+=cos(direction)*speed;
  }
  boolean crash (float tx, float ty, int tsize) {
    //if (dist(x,y,tx,ty)<tsize) {
    if(abs(ty-y)<tsize & abs(tx-x)<tsize-size/2) {
      return true;
    } else {
    return false;
    }
  
  }
}
