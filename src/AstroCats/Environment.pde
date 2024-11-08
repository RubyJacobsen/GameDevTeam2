class Environment {
PImage nebula;
int wave;
int star[][] = new int[(width*height)/10000][2];
Environment(int wave) {
  nebula=loadImage("nebulaRJ.png");
  this.wave=wave;
  for(int i=0;i<star.length;i++) {
    star[i][0]=int(random(width/100))*100;
    star[i][1]=int(random(height/100))*100;
  }
}
  void stars() {
    fill(128);
    for(int i=0;i<star.length;i++) {
    rect(star[i][0],star[i][1],10,5);
    }
  }
  void nebula() {}
  
  
}
