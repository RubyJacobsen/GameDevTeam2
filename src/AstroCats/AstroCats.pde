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
Upgrade[] upgrades = new Upgrade[3];
//u1, u2, u3;
ArrayList<Xp> xps = new ArrayList<Xp>();

//Some variables
int m=millis();
int lastXP;
int exp = 0;
int lvl = 1;
int expr = lvl*20;
float t = random(7);
char upt;
int wave=0;
boolean playing = false;
int intro;



//Files
PImage startbutton, introPic;
SoundFile bgm, edead, lvlup, pdead, pew, collect, start;


//Images
void setup() {
  fullScreen();
  startbutton = loadImage("StartButton.png");
  p = new Player(260, 160);
  e1= new Environment(0);
  // ill do random later, after adding more upgrades
  for (int i=0; i<upgrades.length; i++) {
    //upt=int(random(6));
    upgrades[i]=new Upgrade(width/2+220*(i-1), height/2-30, roll(int(random(6))));
  }
  xps.add(new Xp(width/2, height/2));
  info = new Infopanel(0, 100, 1);
  a1=new Asteroid(100, 100, 180, ' ');
  fill(255);
  textAlign(CENTER, CENTER);
  text("Wave " + wave, width-50, height-10);
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
    textSize(20);
    if(millis()>(intro+1)*3000) {intro++;}
    switch (intro) {
    case 1: text("meow meow meow meow",width/2,height/2);
    break;
    case 2: text("meow meow meow meow meow",width/2,height/2);
    break;
    case 3: text("meow meow meow ",width/2,height/2);
    break;
    case 4: text("meow meow meow meow meow meow meow meow",width/2,height/2);
    break;
    case 5: text("meow meow meow meow",width/2,height/2);
    break;
    case 6: text("meow meow meow meow meow me-",width/2,height/2);
    break;
    case 7: text("MEOW MEOW MEOW MEOW!!!!",width/2,height/2);
    break;
    case 8: text("meow meow meow meOW!!",width/2,height/2);
    break;
    case 9: text("meow meow meow meow meow meow???",width/2,height/2);
    break;
    case 10: text("m-m-m-meow...",width/2,height/2);
    break;
    case 11: text("meow meow meow meow",width/2,height/2);
    break;
    case 12: text("meow meow meow meow meow!!!!",width/2,height/2);
    break;
    default:
    image(startbutton, width/2, height/2);
      
    
    
    
    }
    
    
    text("(The introduction of this game is written in cat language)",width/2,height/2+50);
   // startbutton.resize(millis()/20, millis()/20);
    
    if (mousePressed) {
      playing=true;
      start.play();
      p = new Player(width/2, height/2);
      wave = 0;
      for (int i=enemies.size()-1; i>=0; i--) {
        enemies.remove(i);
      }
    }
  }  else if (exp >= expr) {
          println("tew");
        for (int i=0; i<upgrades.length; i++) {
          println("tes");
          upgrades[i].display();
          upgrades[i].hover();
          if (mousePressed == true && upgrades[i].hover() == true) {
            exp = exp-expr;
            lvl++;
            expr += 10;
            info.levelUp(); //<>//
            level(upgrades[i].c, i); //<>//
            lvlup.play();
            for (Upgrade u : upgrades) {
              u.c=roll(int(random(7)));
            }
          }
        }
        
      }
  
  else {
    m=millis();
    background(#000000);
    e1.stars();
    e1.nebula(wave);
    e1.blackHole(wave);
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
      if (wave==10) {

        enemies.add(new Enemy(0, 4*height/10, 1000, 'e'));
        enemies.add(new Enemy(7*width/10, 1*height/10, 1000, 'e'));
        enemies.add(new Enemy(5*width/10, 7*height/10, 1000, 'e'));
      } else {
        for (int i=0; i<tempe*wave; i++) {
          enemies.add(new Enemy(tempx, tempy, 100+(wave-1)*15, 'b'));
        } //<>//
      } //<>//
    } //<>//
       //<>//
      //eeeenmie logic
      for (Enemy e : enemies) {
        e.display(p.x, p.y);
        e.move();

        if (e.fire(m)) {
          projectiles.add(new Projectile(false, e.x, e.y, 8, e.direction+random(-PI/8, PI/8), e.d, 45));
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
      rect(70, 50, ((p.health/p.maxhealth)*346), 45);
      if (p.health < p.maxhealth) {
        p.health += p.regen;
      }
      info.display();
      fill(255);
      textSize(25);
      text("Wave: " + wave, 50, 250);
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

  char roll(int t) {
    switch (t) {
    case 0:
      return 'd';

    case 1:
      return 's';

    case 2:
      return 'r';

    case 3:
      return 'p';

    case 4:
      return 'h';

    case 5:
      return 'f';
    case 6:
      return 'z';
    default:
      return ' ';
    }
  }
  void level(char c, int up) {
    if (c == 's') {
      p.friction -= p.friction*0.03;
      upgrades[up].slvl++;
    } else if (c == 'd') {
      p.gundamage += 10;
      upgrades[up].dlvl++;
    } else if (c == 'f') {
      p.atkcd -= p.atkcd*0.04;
      upgrades[up].flvl++;
    } else if (c == 'p') {
      p.bspeed += 1.5;
      upgrades[up].plvl++;
    } else if (c == 'h') {
      p.health += 15;
      p.maxhealth += 15;
      upgrades[up].hlvl++;
    } else if (c == 'r') {
      p.regen += .02;
      upgrades[up].rlvl++;
    } else if (c == 'z') {
      p.bsize += 2;
      upgrades[up].zlvl++;
    }
  }
