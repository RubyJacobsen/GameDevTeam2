//Brannon Lai | 10/4/24 | Cats In Space Group Project
player p;


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
