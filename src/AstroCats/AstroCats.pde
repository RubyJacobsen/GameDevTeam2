// Ruby Jacobsen | AstroCats | 9 Oct 2024

Player p;
Enemy e1, e2;


void setup() {
  size(500, 500);
  p = new Player(260, 160);
  e1 = new Enemy(250, 50);
  e2 = new Enemy(250, 400);
  
}

void draw() {
  background(0);
  p.display();
  p.move();
  e1.display(p.px,p.py);
  e2.display(p.px,p.py);
  e1.move();
}
