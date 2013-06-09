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
      Bullet bu=balls.get(i);
      bu.display();


      for (int j=0;j<shots.size();j++) {
        Bullet original=shots.get(j);
        //original.touch(balls,bu); 
        bu.touch(shots, balls, original);
      }
    }
    //--------checks level balls with level balls
    //    for (int i=0;i<balls.size();i++) {
    //      Bullet bu1=balls.get(i);
    //      for (int j=0;j<balls.size();j++) {
    //        if (j!=i) {
    //          Bullet bu2=balls.get(j);
    //          bu1.touch(balls, balls, bu2);
    //        }
    //      }
    //    }
    //-------can be commented out without harm
  
  }
  void update2(){
    //makes sure all balls touching in level are colore differently
     for (int i=0;i<balls.size();i++) {
      Bullet bu1=balls.get(i);
      for (int j=0;j<balls.size();j++) {
        if (j!=i) {
          Bullet bu2=balls.get(j);
          if (dist(bu1.x, bu1.y, bu2.x, bu2.y)<=bu1.d/2+bu2.d/2&&bu1.n==bu2.n) {
            bu1.n=int(random(1, 6));
            bu2.n=int(random(1, 6));
          }
        }
      }
    } 
  }
}
