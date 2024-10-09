// Ruby Jacobsen | AstroCats | 9 Oct 2024

Player p;


void setup() {
size(500,500);
p = new player(260,160);

}
void draw() {
background(0);
p.display();
p.move();
//p.x+=0.3;
}
