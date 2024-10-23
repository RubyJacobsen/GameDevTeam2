// Ruby Jacobsen | AstroCats | 9 Oct 2024

Player p;
Projectile p1;
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
int m=millis();
Upgrade u1, u2, u3;
ArrayList<Xp> xps = new ArrayList<Xp>();
void setup() {
  size(500, 500);
  p = new Player(260, 160);
  enemies.add(new Enemy(250, 50, 100));
  enemies.add(new Enemy(250, 400, 100));
  u1 = new Upgrade(80, 90, 'h');
  u2 = new Upgrade(190, 90, 'd');
  u3 = new Upgrade(300, 90, 's');
  //p1 = new Projectile(true, width/2, height/2, 1.3, 2.13, 0, 70);
  xps.add(new Xp(width/2, height/2));
}

void draw() {
  m=millis();
  background(#200329);
  p.display();
  p.move();
  u1.display();
  u2.display();
  u3.display();
  u1.hover();
  u2.hover();
  u3.hover();
  for ( Enemy e : enemies) {
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
xps.add(new Xp(enemies.get(j).x+random(-enemies.get(j).size, enemies.get(j).size), enemies.get(j).y+random(-enemies.get(j).size, enemies.get(j).size)));xps.add(new Xp(enemies.get(j).x+random(-enemies.get(j).size, enemies.get(j).size), enemies.get(j).y+random(-enemies.get(j).size, enemies.get(j).size)));xps.add(new Xp(enemies.get(j).x+random(-enemies.get(j).size, enemies.get(j).size), enemies.get(j).y+random(-enemies.get(j).size, enemies.get(j).size)));
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
    if (xps.get(i).crash(p.x, p.y, 1)) {
      xps.remove(i);
    }
  }
}
