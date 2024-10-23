class Player {
  PImage ship;
  float x, y, vy, vx, direction, friction, ay, ax, atkcd, bspeed;
  int bullets, bsize, guncount, gundamage, health, xp, level;
  int lastATK;

  Player(float x, float y) {
    this.x=x;
    this.y=y;
    friction=0.1; //to be multiplied by current velocity and subtracted by acceleration
    atkcd=0.3;//measured in seconds
    guncount=1;
    gundamage=10;
    health=100;
    level=1;
    bsize=50;
    bspeed=5;
    ship = loadImage("Spaceship-1.png");
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
    keyPressed();
    //keyReleased();

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

  void keyPressed() {
    if(keyPressed) {
    if (key=='w'||key=='W') {
      //ay=-1;
      vy-=1;
    } else if (key=='s'||key=='S') {
      //ay=1;
      vy+=1;
    } else if (key=='a'||key=='A') {
      //ax=-1;
      vx-=1;
    } else if (key=='d'||key=='D') {
      //ax=1;
      vx+=1;
    } else {
    vx=0;
    vy=0;
    }
    }
  }
  void keyReleased() {
    if (key=='w'||key=='W') {
      //ay=-1;
      //vy-=-1;
  
    } else if (key=='s'||key=='S') {
      //ay=1;
      //vy+=-1;
    } else if (key=='a'||key=='A') {
      //ax=-1;
      //vx-=-1;
    } else if (key=='d'||key=='D') {
      //ax=1;
      //vx+=-1;
    }
  }
}
