class Upgrade {
  // Member Variables
  int x, y;
  float c;
  PImage upgrade1;

  // Constructor
  Upgrade(int x, int y) {
    this.x=x;
    this.y=y;
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
