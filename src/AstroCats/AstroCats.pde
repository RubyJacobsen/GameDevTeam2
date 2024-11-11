// Ruby Jacobsen | AstroCats | 9 Oct 2024
import processing.sound.*;
//Test classes and one ofs
Player p;
Projectile p1;
Infopanel info;
Asteroid a1;
Environment e1;
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
float t = random(6);
char upt;
int wave=1;
boolean playing = false;

//Files
PImage startbutton;
SoundFile bgm, edead, lvlup, pdead, pew, collect, start;


//Images
void setup() {
  size(500, 500);
  startbutton = loadImage("StartButton.png");
  p = new Player(260, 160);
  e1= new Environment(0);
  // ill do random later, after adding more upgrades
  roll();
  xps.add(new Xp(width/2, height/2));
  info = new Infopanel(0, 100, 1);
  a1=new Asteroid(100, 100, 180);
  bgm=new SoundFile(this, "mixkit-POTENTIALbackground.wav");
  bgm.loop();
  edead = new SoundFile(this, "mixkit-smallexplosionEH-2759.wav");
  collect = new SoundFile(this, "mixkit-acheivementsoundEH.wav");
  pdead = new SoundFile(this, "mixkit-largerexplosionEH-1702.wav");
  pew = new SoundFile(this, "mixkitsmall-lasersoundEH.wav");
  lvlup = new SoundFile(this, "mixkit-upgradeEH.wav");
  start = new SoundFile(this, "mixkit-spaceship-soundEH.wav");
}

void draw() {
  if (!playing) {
    background(#000000);
    startbutton.resize(100, 100);
    image(startbutton, width/2, height/2);
    if (mousePressed) {
      playing=true;
      start.play();
      p = new Player(width/2, height/2);
      wave = 1;
      for (int i=enemies.size()-1; i>=0; i--) {
        enemies.remove(i);
      }
    }
  } else {
    m=millis();
    background(#000000);
    e1.stars();
    e1.nebula(wave);
    p.display();
    p.move();
    a1.move();
    a1.display();
    //level and upgrades
    if (enemies.size()==0) {
      wave++;
      float tempx=random(width-10);
      float tempy=random(height-10);
      int tempe=int(random(2, 4));
      for (int i=0; i<tempe*wave; i++) {
        enemies.add(new Enemy(tempx, tempy, wave+100));
      }
    }
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
          p.friction -= p.friction*0.03;
          u1.slvl++;
        }
        if (u1.c == 'd') {
          p.gundamage += 5;
          u1.dlvl++;
        }
        if (u1.c == 'f') {
          p.atkcd -= p.atkcd*0.04;
          u1.flvl++;
        }
        if (u1.c == 'p') {
          p.bspeed += 1.5;
          u1.plvl++;
        }
        if (u1.c == 'h') {
          p.health += 15;
          p.maxhealth += 15;
          u1.hlvl++;
        }
        if (u1.c == 'r') {
          p.regen += .005;
          u1.rlvl++;
        }
        lvlup.play();
        roll();
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
        if (u2.c == 'f') {
          p.atkcd -= 0.02;
          u1.flvl++;
        }
        if (u2.c == 'p') {
          p.bspeed += 1.5;
          u1.plvl++;
        }
        if (u2.c == 'h') {
          p.health += 15;
          p.maxhealth += 15;
          u2.hlvl++;
        }
        if (u2.c == 'r') {
          p.regen += .005;
          u2.rlvl++;
        }
        lvlup.play();
        roll();
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
        if (u3.c == 'f') {
          p.atkcd -= 0.02;
          u1.flvl++;
        }
        if (u3.c == 'p') {
          p.bspeed += 1.5;
          u1.plvl++;
        }
        if (u3.c == 'h') {
          p.health += 15;
          p.maxhealth += 15;
          u3.hlvl++;
        }
        if (u3.c == 'r') {
          p.regen += .005;
          u3.rlvl++;
        }
        lvlup.play();
        roll();
      }
    }
    //eeeenmie logic
    for (Enemy e : enemies) {
      e.display(p.x, p.y);
      e.move();

      if (e.fire(m)) {
        projectiles.add(new Projectile(false, e.x, e.y, 4, e.direction+random(-PI/8, PI/8), 5, 30));
      }
    }
    //Attack Cooldown, fire bullet
    if (mousePressed) {
      if (m-p.lastATK>p.atkcd*1000) {
        projectiles.add(new Projectile(true, p.x, p.y, p.bspeed, p.direction, p.gundamage, p.bsize));
        p.lastATK=m;
        pew.play();
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
            edead.play();
          }
        }
      }
      if ( i<projectiles.size()) {
        if (projectiles.get(i).crash(p.x, p.y, 50) & !projectiles.get(i).f ) {
          p.health-=projectiles.get(i).damage;
          projectiles.remove(i);
          if (p.health<0) {
            playing=false;
            pdead.play();
          }
        }
      }
      //player and projectile die on collision
    }
    //Logic for XP
    for (int i=0; i<xps.size(); i++) {
      xps.get(i).display();
      xps.get(i).move(p.x, p.y);
      if (xps.get(i).crash(p.x, p.y, 10) & m-lastXP>10) {
        lastXP=m;
        xps.remove(i);
        collect.play();
        exp+=1;
      }
    }

    //health and xp bars
    fill(0);
    rectMode(CENTER);
    rect(width/2, 59*height/64, 3*width/4, height/32);
    fill(255, 0, 0);
    rectMode(CORNER);
    strokeWeight(0);
    rect(50, 33, ((p.health/p.maxhealth)*246), 30);
    if (p.health < p.maxhealth) {
      p.health += p.regen;
    }
    info.display();
    fill(0, 0, 255);
    if (exp<=expr) {
      rect(((width/2)-0.5*(0.75*width)+1), (59*height/64)-((height/64)-5), (float(exp)/float(expr))*(3*width/4), (height/32)-6);
    } else {
      rect(((width/2)-0.5*(0.75*width)+1), (59*height/64)-((height/64)-5), (3*width/4)-4, (height/32)-6);
    }
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

void roll() {
  random(6);
  if (t < 1) {
    upt = 'd';
  } else if (t < 2) {
    upt = 's';
  } else if (t < 3) {
    upt = 'r';
  } else if (t < 4) {
    upt = 'p';
  } else if (t < 5) {
    upt = 'h';
  } else if (t < 6) {
    upt = 'f';
  }
  u1 = new Upgrade(80, 90, upt);
  t -= random(3);
  if (t < 0) {
    t += 6;
  } else if (t < 1) {
    upt = 'd';
  } else if (t < 2) {
    upt = 's';
  } else if (t < 3) {
    upt = 'r';
  } else if (t < 4) {
    upt = 'p';
  } else if (t < 5) {
    upt = 'h';
  } else if (t < 6) {
    upt = 'f';
  }
  u2 = new Upgrade(190, 90, upt);
  t -= random(3);
  if (t < 0) {
    t += 6;
  } else if (t < 1) {
    upt = 'd';
  } else if (t < 2) {
    upt = 's';
  } else if (t < 3) {
    upt = 'r';
  } else if (t < 4) {
    upt = 'p';
  } else if (t < 5) {
    upt = 'h';
  } else if (t < 6) {
    upt = 'f';
  }
  u3 = new Upgrade(300, 90, upt);
}
