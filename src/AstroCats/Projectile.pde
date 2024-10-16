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
      c=#ff0000;
    }
  }
  void display() {
    fill (c);
    pushMatrix();
    translate(x,y);
    rotate(direction);
  rect(0,0,size,size/4);
  popMatrix();
  }
  void move() {
  y-=sin(direction);
  x-=cos(direction);
  }
}
