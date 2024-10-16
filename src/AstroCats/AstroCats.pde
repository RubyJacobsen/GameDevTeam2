// Ruby Jacobsen | AstroCats | 9 Oct 2024

Player p;
Projectile p1;
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
int m=millis();


void setup() {
  size(500, 500);
  p = new Player(260, 160);
  enemies.add(new Enemy(250, 50));
  enemies.add(new Enemy(250, 400));

  //p1 = new Projectile(true, width/2, height/2, 1.3, 2.13, 0, 70);
}

void draw() {
  m=millis();
  background(0);
  p.display();
  p.move();
  for ( Enemy e : enemies) {
    e.display(p.x, p.y);
    e.move();
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
    for (Enemy eeenmie : enemies) {
      if (projectiles.get(i).crash(eeenmie.x, eeenmie.y, eeenmie.size)) {
        projectiles.remove(i);
        if(i>=projectiles.size()){
          break;
        }
      }
    }
  }
  //p.x+=0.3;
}
