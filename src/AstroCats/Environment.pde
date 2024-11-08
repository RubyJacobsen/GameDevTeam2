class Environment {
PImage nebula;
int wave;
int star[][] = new int[(width*height)/25][2];
Environment(int wave) {
  nebula=loadImage("nebulaRJ.png");
  this.wave=wave;
  for(int i=0;i<star.length;i++) {
    star[i][0]=int(random(width/5))*5;
    star[i][1]=int(random(height/5))*5;
  }
}
  void stars() {
    for(int i=0;i<star.length;i++) {
    rect(star[i][0],star[i][1],10,5);
    }
  }
  void nebula() {}
  
  
}
