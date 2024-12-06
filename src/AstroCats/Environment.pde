class Environment {
PImage nebula, bh;
int wave;
int star[][] = new int[(width*height)/10000][2];
Environment(int wave) {
  nebula=loadImage("nebulaRJ.png");
  nebula.resize(100,100);
  bh = loadImage("blackholeRJ.png");
  bh.resize(150,150);
  this.wave=wave;
  for(int i=0;i<star.length;i++) {
    star[i][0]=int(random(width/25))*25;
    star[i][1]=int(random(height/25))*25;
  }
}
  void stars() {
    fill(128);
    for(int i=0;i<star.length;i++) {
    rect(star[i][0],star[i][1],10,5);
    }
  }
  void nebula(int w) {
    tint(255,w*25+5);
    image(nebula,0,4*height/10);
    image(nebula,7*width/10,1*height/10);
    image(nebula,5*width/10,7*height/10);
    tint(255,255);
  }
  void blackHole(int w) {
    tint(255, w*25+5);
    image(bh, 4*width/10, 4*height/10);
    tint(255,255);
  }
  
}
