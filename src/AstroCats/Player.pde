class Player {
  PImage ship;
  float x, y, vy, vx, direction, friction, ay, ax, atkcd, bspeed, regen, health, maxhealth;
  int bullets, bsize, guncount, gundamage, xp, level;
  int lastATK;
  public boolean[] keys = new boolean[4];
  Player(float x, float y) {
    this.x=x;
    //e
    this.y=y;
    friction=0.12; //to be multiplied by current velocity and subtracted by acceleration
    atkcd=0.5;//measured in seconds
    guncount=1;
    gundamage=12;
    health=100;
    maxhealth=health;
    level=1;
    bsize=50;
    bspeed=10;
    regen = .02;
    ship = loadImage("Spaceship-1.png");
    for (int i=0; i<keys.length-1; i++) {
      keys[i]=false;
    }
  }
  void display() {
    fill(0, 255, 0);
    pushMatrix();
    imageMode(CENTER);
    //translate(width/2,height/2);
    translate(x, y);
    direction=atan2(mouseY-y, mouseX-x);
    rotate(direction);
    ship.resize(75, 75);
    image(ship, 0, 0);
    popMatrix();
  }
  void move() {
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
    //ax=1;
    
    if (keys[0]) {
      vy-=0.5;
    }
    if (keys[1]) {
      vy+=0.5;
    }
    if (keys[2]) {
      vx-=0.5;
    }
    if (keys[3]) {
      vx+=0.5;
    }

    if (x>width+50) {
      x=-50;
    } else if (x<-50) {
      x=width+50;
    } else if (y>height+50) {
      y=-50;
    } else if (y<-50) {
      y=height+50;
    }
  }
  //boolean mousePressed() {
  //  if (mousePressed) {
  //    return true;
  //  } else {return false;}
  //}
  //int canATK(int thisATK) {
  //  if (thisATK-lastATK>atkcd) {
  //    lastATK=thisATK;
  //    return thisATK;
  //  } else {
  //    return -1;
  //  }
  //}


}
  
