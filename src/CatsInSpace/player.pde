class player {
  PImage ship;
  float x, y, vy, vx, direction, friction, ay,ax, atkcd ;
  int bullets, guncount, gundamage, health, xp, level;
  //u[]:upgrades
  player(float x, float y) {
    this.x=x;
    this.y=y;
    friction=0.1; //to be multiplied by current velocity and subtracted by acceleration
    atkcd=1;//measured in seconds
    guncount=1;
    gundamage=10;
    health=100;
    level=1;
    
  }
  void display() {
    pushMatrix();
    rectMode(CENTER);
    //translate(width/2,height/2);
    translate(x, y);
    rotate(atan2(mouseY-y, mouseX-x));
    rect(0, 0, 80, 80);
    popMatrix();
  }
  void move() {
  x+=vx;
  //vx+=ax-((vx*friction));
  vx-=pow(vx,1/3)*friction;
  println(pow(-39393.0,0.3));
  y+=vy;
  //vy+=ay-((vy*friction));
  vy-=pow(vy,1/3)*friction;
  //ax=1;
  if(keyPressed) {
  if(key=='w'||key=='W'){
  //ay=-1;
  vy-=1;
  }else if(key=='s'||key=='S'){
  //ay=1;
  vy+=1;
  }else if(key=='a'||key=='A'){
  //ax=-1;
  vx-=1;
  }else if(key=='d'||key=='D'){
  //ax=1;
  vx+=1;
  }
  
  }
  if(x>width+50){
  x=-50;
  } else if(x<-50){
  x=width+50;
  } else if (y>height+50) {
  y=-50;
  } else if (y<-50) {
  y=height+50;
  }
  }
}
