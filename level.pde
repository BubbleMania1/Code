class Level {
  ArrayList <Bullet> balls=new ArrayList <Bullet>();
  int size;
  Bullet bu;


  boolean load=false;

  Level(int tsize) {
    size=tsize;
  } 
  void update() {
    while (balls.size ()<size) {
      balls.add(new Bullet());
     
    }

  }
  void display() {
    fill(255);

    text("Level "+levelcounter, width/2, textAscent()+textDescent());
    for (int i=0;i<balls.size();i++) {
      Bullet bu=(Bullet)balls.get(i);
      bu.display();


      for (int j=0;j<shots.size();j++) {
        Bullet original=(Bullet)shots.get(j);
        //original.touch(balls,bu); 
        bu.touch(shots, balls, original);
   
      }
    }
  }
}