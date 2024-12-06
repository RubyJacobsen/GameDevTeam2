class Infopanel {
  int score;
  int health;
  int level;
  PImage healthbar;

  Infopanel(int initialScore, int initialHealth, int initialLevel) {
    score = initialScore;
    health = initialHealth;
    healthbar= loadImage("HealthBarRJ.png");
    level = initialLevel;
  }

  // Call this function to update score
  void updateScore(int points) {
    score += points;
  }

  // Call this function to update health
  void updateHealth(int change) {
    health += change;
    health = constrain(health, 0, 100); // Health capped at 100
  }



  // Call this function to increase level
  void levelUp() {
    level += 1;
  }




  // Display the panel with information
  void display() {
    // Draw background for info panel
    //fill(50, 50, 50, 150); // Semi-transparent background
    //rectMode(CORNER);
    //rect(10, 10, 200, 80);

    // Set text properties
    fill(255);
    textSize(12);
    textMode(CORNER);
    textAlign(LEFT);
    // Display the score
    //text("Score: " + score, 20, 30);

    //// Display the health
    //text("Health: " + health, 20, 50);
    //text("Level: " + level, 20, 70);
    imageMode(CORNER);
    image(healthbar,-60,-225,800,600);
    // Display the level
    
  }
}
