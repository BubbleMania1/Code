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
    //note: text being partially hidden by balls is intentional
    //if fix necessary, move text to function called after ball display function
    //or remove last few balls from array
    fill(255);
    if (levelcounter==0) {
      text("Level 0: Tutorial", width/2, textAscent()+textDescent());
      // text("Level "+levelcounter, width/2,2*(textAscent()+textDescent()));
      textSize(20);
      text("Be careful: If a ball stop below the line here, you lose", width/2, height-s.h-(textAscent()+textDescent())/2);
      pushMatrix();
      translate((textAscent()+textDescent())/2, (height-s.h)/2);
      rotate(PI/2);
      text("You can bounce your shots off the wall!", 0, 0);
      //left wall
      popMatrix();
      pushMatrix();
      translate(width-(textAscent()+textDescent())/2, (height-s.h)/2);
      rotate(-PI/2);
      text("You can bounce your shots off the wall!", 0, 0);
      //right wall
      popMatrix();
      text("The background is always the same color as your shot",width/2,height/2-6*(textAscent()+textDescent()));
      text("Shoot at balls with the same color as your shot to pop them for 10 points!",width/2,height/2-4*(textAscent()+textDescent()));
      text("Don't take too many shots; you lose 2 points every shot",width/2,height/2-2*(textAscent()+textDescent()));
      text("Pop all balls to advance to the next level",width/2,height/2);
      text("Shots stick to the ceiling",width/2,(textAscent()+textDescent())/2);
      text("Don't get too used to this aiming beam; it'll disappear next level",width/2,height-s.h-2*(textAscent()+textDescent()));
      textSize(40);
      text("Good Luck!",width/2,height/2+textAscent()+textDescent());
    } else {
      text("Level "+levelcounter, width/2, textAscent()+textDescent());
    }
    for (int i=0;i<balls.size();i++) {
      Bullet bu=balls.get(i);
      bu.display();


      for (int j=0;j<shots.size();j++) {
        Bullet original=shots.get(j);

        bu.touch(shots, balls, original);
      }
    }
    //--------checks level balls for intersect with level balls
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
  void colorcheck() {
    //makes sure all balls touching in level are colore differently
    for (int i=0;i<balls.size();i++) {
      Bullet bu1=balls.get(i);
      while(bu1.pspawn==1){
       bu1.pspawn=int(random(1,3)); 
      }
      for (int j=0;j<balls.size();j++) {
        if (j!=i) {
          Bullet bu2=balls.get(j);
          while (dist (bu1.x, bu1.y, bu2.x, bu2.y)<=bu1.d/2+bu2.d/2&&bu1.n==bu2.n) {
            bu1.n=int(random(1, 6));
            bu2.n=int(random(1, 6));
          }
        }
      }
    }
    
  }
}
