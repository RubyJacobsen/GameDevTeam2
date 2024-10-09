// Ruby Jacobsen | AstroCats | 9 Oct 2024

Player p;
Enemy e1, e2;
Projectile p1;


void setup() {
  size(500, 500);
  p = new Player(260, 160);
  e1 = new Enemy(250, 50);
  e2 = new Enemy(250, 400);
  p1 = new Projectile(true,width/2,height/2,1.3,2.13,0,70);
}

void draw() {
  background(0);
  p.display();
  p.move();
  //e1.display(p.x,p.y);
  //e2.display(p.x,p.y);
  e1.move();
  p1.display();
p1.move();
//p.x+=0.3;
}
