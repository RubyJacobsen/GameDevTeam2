// Ruby Jacobsen | AstroCats | 9 Oct 2024

//Test classes and one ofs
Player p;
Projectile p1;
Infopanel info;
Asteroid a1;

//Arrays
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
Upgrade u1, u2, u3;
ArrayList<Xp> xps = new ArrayList<Xp>();

//Some variables
int m=millis();
int lastXP;
int exp = 0;
int lvl = 1;
int expr = lvl*20;

//Images
void setup() {
  size(500, 500);
  p = new Player(260, 160);
  enemies.add(new Enemy(250, 50, 100));
  enemies.add(new Enemy(250, 400, 100));
  enemies.add(new Enemy(250, 400, 100));
  enemies.add(new Enemy(250, 400, 100));
  enemies.add(new Enemy(250, 400, 100));
  enemies.add(new Enemy(250, 400, 100));
  u1 = new Upgrade(80, 90, 'f');
  u2 = new Upgrade(190, 90, 'h');
  u3 = new Upgrade(300, 90, 'd');
  xps.add(new Xp(width/2, height/2));
  info = new Infopanel(0, 100, 1);
  a1=new Asteroid(100, 100, 180);
}

void draw() {
  m=millis();
  background(#200329);
  p.display();
  p.move();
  a1.move();
  a1.display();
  //level and upgrades
  if (exp >= expr) {
    u1.display();
    u2.display();
    u3.display();
    u1.hover();
    u2.hover();
    u3.hover();
    if (mousePressed == true && u1.hover() == true) {
      exp = exp-expr;
      lvl++;
      info.levelUp();
      if (u1.c == 's') {
        p.friction -= 0.005;
        u1.slvl++;
      }
      if (u1.c == 'd') {
        p.gundamage += 5;
        u1.dlvl++;
      }
      if (u1.c == 'f') {
        p.atkcd -= 0.02;
        u1.flvl++;
      }
    }
    if (mousePressed == true && u2.hover() == true) {
      exp = exp-expr;
      lvl++;
      info.levelUp();
      if (u2.c == 's') {
        p.friction -= 0.005;
      }
      if (u2.c == 'd') {
        p.gundamage += 5;
        u1.dlvl++;
      }
    }
    if (mousePressed == true && u3.hover() == true) {
      exp = exp-expr;
      lvl++;
      info.levelUp();
      if (u3.c == 's') {
        p.friction -= 0.005;
      }
      if (u3.c == 'd') {
        p.gundamage += 5;
        u1.dlvl++;
      }
    }
  }

  for (Enemy e : enemies) {
    e.display(p.x, p.y);
    e.move();
  }

  //Attack Cooldown, fire bullet
  if (mousePressed) {
    if (m-p.lastATK>p.atkcd*1000) {
      projectiles.add(new Projectile(true, p.x, p.y, p.bspeed, p.direction, p.gundamage, p.bsize));
      p.lastATK=m;
    }
  }
  //Logic for every projectile
  for (int i=0; i<projectiles.size(); i++) {
    projectiles.get(i).display();
    projectiles.get(i).move();
    float tempx = projectiles.get(i).x;
    float tempy = projectiles.get(i).y;
    float temps = projectiles.get(i).size;
    //Projectile dies at border
    if (tempx-temps>width||tempx+temps<0||tempy-temps>height||tempy+temps<0) {
      projectiles.remove(i);
      //println(projectiles.size());
    }
    //Projectile and enemy die on collision
    for (int j=0; j<enemies.size(); j++) {
      //println(j);
      if (i>=projectiles.size()) {
        break;
      }
      if (projectiles.get(i).crash(enemies.get(j).x, enemies.get(j).y, enemies.get(j).size) & projectiles.get(i).f) {
        enemies.get(j).hp-=projectiles.get(i).damage;

        projectiles.remove(i);

        if (enemies.get(j).hp<=0) {
          xps.add(new Xp(enemies.get(j).x+random(-enemies.get(j).size, enemies.get(j).size), enemies.get(j).y+random(-enemies.get(j).size, enemies.get(j).size)));
          xps.add(new Xp(enemies.get(j).x+random(-enemies.get(j).size, enemies.get(j).size), enemies.get(j).y+random(-enemies.get(j).size, enemies.get(j).size)));
          xps.add(new Xp(enemies.get(j).x+random(-enemies.get(j).size, enemies.get(j).size), enemies.get(j).y+random(-enemies.get(j).size, enemies.get(j).size)));
          xps.add(new Xp(enemies.get(j).x+random(-enemies.get(j).size, enemies.get(j).size), enemies.get(j).y+random(-enemies.get(j).size, enemies.get(j).size)));
          xps.add(new Xp(enemies.get(j).x+random(-enemies.get(j).size, enemies.get(j).size), enemies.get(j).y+random(-enemies.get(j).size, enemies.get(j).size)));
          xps.add(new Xp(enemies.get(j).x+random(-enemies.get(j).size, enemies.get(j).size), enemies.get(j).y+random(-enemies.get(j).size, enemies.get(j).size)));
          xps.add(new Xp(enemies.get(j).x+random(-enemies.get(j).size, enemies.get(j).size), enemies.get(j).y+random(-enemies.get(j).size, enemies.get(j).size)));
          xps.add(new Xp(enemies.get(j).x+random(-enemies.get(j).size, enemies.get(j).size), enemies.get(j).y+random(-enemies.get(j).size, enemies.get(j).size)));
          xps.add(new Xp(enemies.get(j).x+random(-enemies.get(j).size, enemies.get(j).size), enemies.get(j).y+random(-enemies.get(j).size, enemies.get(j).size)));
          xps.add(new Xp(enemies.get(j).x+random(-enemies.get(j).size, enemies.get(j).size), enemies.get(j).y+random(-enemies.get(j).size, enemies.get(j).size)));

          xps.add(new Xp(enemies.get(j).x+random(-enemies.get(j).size, enemies.get(j).size), enemies.get(j).y+random(-enemies.get(j).size, enemies.get(j).size)));
          enemies.remove(j);
        }
      }
    }
  }
  //Logic for XP
  for (int i=0; i<xps.size(); i++) {
    xps.get(i).display();
    xps.get(i).move(p.x, p.y);
    if (xps.get(i).crash(p.x, p.y, 1) & m-lastXP>10) {
      lastXP=m;
      xps.remove(i);
      exp+=1;
    }
  }

  //health and xp bars
  fill(0);
  rectMode(CENTER);


  rect(width/2, 29*height/32, 3*width/4, height/32);
  fill(255, 0, 0);
  rectMode(CORNER);
  strokeWeight(0);
  rect(50, 33, ((float(p.health)/float(p.maxhealth))*246), 30);
  info.display();
  fill(0, 0, 255);
  if (exp<=expr) {
    rect(((width/2)-0.5*(0.75*width)+1), (59*height/64)-((height/64)-5), (float(exp)/float(expr))*(3*width/4), (height/32)-6);
  } else {
    rect(((width/2)-0.5*(0.75*width)+1), (59*height/64)-((height/64)-5), (3*width/4)-4, (height/32)-6);
  }
}

//movement
void keyPressed() {
  if (key=='w'||key=='W') {
    //ay=-1;
    p.keys[0]=true;
  }
  if (key=='s'||key=='S') {
    //ay=1;
    p.keys[1]=true;
  }
  if (key=='a'||key=='A') {
    //ax=-1;
    p.keys[2]=true;
  }
  if (key=='d'||key=='D') {
    //ax=1;
    p.keys[3]=true;
  }
}

void keyReleased() {

  if (key=='w'||key=='W') {
    //ay=-1;
    p.keys[0]=false;
  }
  if (key=='s'||key=='S') {
    //ay=1;
    p.keys[1]=false;
  }
  if (key=='a'||key=='A') {
    //ax=-1;
    p.keys[2]=false;
  }
  if (key=='d'||key=='D') {

    //ax=1;
    p.keys[3]=false;
  }
}
