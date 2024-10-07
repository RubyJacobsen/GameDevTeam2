class player {
  PImage ship;
  float x, y, velocity, direction, friction, acceleration, atkcd ;
  int bullets, guncount, gundamage, health, xp, level;
  //u[]:upgrades
  player(float x, float y) {
    this.x=x;
    this.y=y;
    friction=0.2; //to be multiplied by current velocity and subtracted by acceleration
    atkcd=1;//measured in seconds
    guncount=1;
    gundamage=10;
    health=100;
    level=1;
  }
  void display() {
    rectMode(CENTER);
    //translate(width/2,height/2);
    translate(x, y);
    rotate(atan2(mouseY-y, mouseX-x));
    rect(0, 0, 80, 80);
  }
}
