// Ruby Jacobsen | AstroCats | 9 Oct 2024

Player p;

Projectile p1;
void setup() {
size(500,500);
p = new Player(260,160);
p1 = new Projectile(true,width/2,height/2,1.3,2.13,0,70);

}
void draw() {
background(0);
p.display();
p.move();
p1.display();
p1.move();
//p.x+=0.3;
}
