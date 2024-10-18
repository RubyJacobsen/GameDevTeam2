// Ruby Jacobsen | AstroCats | 9 Oct 2024

Player p;
Projectile p1;
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
int m=millis();
Upgrade u1, u2;

void setup() {
  size(500, 500);
  p = new Player(260, 160);
  enemies.add(new Enemy(250, 50, 100));
  enemies.add(new Enemy(250, 400, 100));
  u1 = new Upgrade(80, 90, 'h');
  u2 = new Upgrade(170, 90, 'd');
  //p1 = new Projectile(true, width/2, height/2, 1.3, 2.13, 0, 70);
}

void draw() {
  m=millis();
  background(#200329);
  p.display();
  p.move();
  for ( Enemy e : enemies) {
    e.display(p.x, p.y);
    e.move();
    u1.display();
    u2.display();
  }

  //p1.display();
  //p1.move();
  if (mousePressed) {
    if (m-p.lastATK>p.atkcd*1000) {
      projectiles.add(new Projectile(true, p.x, p.y, p.bspeed, p.direction, p.gundamage, p.bsize));
      p.lastATK=m;
    }
  }
  for (int i=0; i<projectiles.size(); i++) {
    projectiles.get(i).display();
    projectiles.get(i).move();
    float tempx = projectiles.get(i).x;
    float tempy = projectiles.get(i).y;
    float temps = projectiles.get(i).size;
    if (tempx-temps>width||tempx+temps<0||tempy-temps>height||tempy+temps<0) {
      projectiles.remove(i);
      //println(projectiles.size());
    }
    
    for (Enemy eeenmie : enemies) {
      if (i>=projectiles.size()) {
      break;
    }
      if (projectiles.get(i).crash(eeenmie.x, eeenmie.y, eeenmie.size) & projectiles.get(i).f) {
        eeenmie.hp-=projectiles.get(i).damage;
        projectiles.remove(i);
      }
    }
  }
  //p.x+=0.3;
}
