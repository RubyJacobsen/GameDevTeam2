class Upgrade {
  // Member Variables
  int x, y;
  float e;
  PImage upgrade1;

  // Constructor
  Upgrade(int x, int y) {
    x=this.x;
    y=this.y;
    upgrade1 = loadImage("tunainspace");
  }

  // Memeber Methods
  void display () {
    imageMode(CENTER);
    upgrade1.resize(50,50);
    image(upgrade1, x, y);
  }

  void move () {
  }
}
