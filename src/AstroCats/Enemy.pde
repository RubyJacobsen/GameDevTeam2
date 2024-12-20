class Enemy {
  float x, y, vx, vy;
  int hp, d, mhp;
  int size=45;
  PImage e1, e2;
  int e = 0;
  int atkCD;//in milliseconds
  int lastATK;
  float direction;
  char t;

  Enemy(float ex, float ey, int h, char t) {
    this.t=t;
     x = ex;
    y = ey;
     hp=h;
     
    mhp=h;
    switch (t) {
   case 'b':
   
    e1 = loadImage("Alien1GH.png");
    e2 = loadImage("Alien2GH.png");
    e = int(random(0, 2));
    vx = random(-5, 5);
    vy = random(-5, 5);
    atkCD=5000;
    lastATK=int(random(0,atkCD))+millis();
    
    d=5;
    break;
    case 'e':
    vx = random(-5, 5);
    vy = random(-5, 5);
    d=10;
    e1 = loadImage("TheEliteGH.png");
    e1.resize(size*3, size*3);
    atkCD=1000;
    break;
  }
    
  }
  void display(float px, float py) {
    pushMatrix();
    translate(x, y);
    direction=(atan2(y-py, x-px))+PI;
    rotate(direction);
    fill(255, 0, 0);
    if (e<1) {
      image(e1, 0, 0, size*1.5, size*1.5);
      //d *= 1.2;
      println(d);
    } else if (e < 2) {
      image(e2, 0, 0, size*1.5, size*1.5);
      //hp *= 1.4;
    } 

    popMatrix();
    if (hp<mhp) {
      rectMode(CENTER);
      strokeWeight(10);
      fill(0);
      rect(x, y-size, size*1.3, 10);
      fill(255, 50, 50);
      strokeWeight(0);
      rectMode(CORNER);
      rect(x-(size*1.3*0.5), y-size-5, float(hp)/float(mhp)*size*1.3, 10);
      strokeWeight(1);
    }
  }

  void move() {
    x += vx/3;
    y += vy/3;
    if (x > width-10 || x < 10) {
      vx *= -1;
    }
    if (y > height-10 || y < 10) {
      vy *= -1;
    }
  }
  boolean fire(int time) {
    if(time-lastATK>atkCD) {
      lastATK=time;
      //atkCD=int(random(atkCD-atkCD/4,atkCD+atkCD/4));
      return true;
    } else {return false;}
  }
}
