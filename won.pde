class Won {
  float t, t2=127.5, tHeight;
  //t controls transparency of almost everything
  //tHeight=textHeight (doesn't match textSize() by default


  float x, y, y1;
  float h=0, s=0, b=255;
  Ball b1=new Ball();
  Button restart=new Button("Play again?", color(180, 200, 255, 120), color(0, 0, 255, 150), color(255), color(255));
  
  Won() {
  }
  void display() {
    if (keyPressed&&key==ENTER) {
      t=765+255;
      t2=0;
      //skips fade animation
    }


    rectMode(CORNER);


    fill(132, 120, 255, t);
    rect(0, 0, width, height);
    t++;
    if (t>255) {
      //only starts when background completely fades in
      b1.display();

      tHeight=textAscent()+textDescent();

      fill(h, s, b, t-560);
      text("Rank: "+rank, width/2, height/2-tHeight*4);
      if (t<(255+510)/2) {
        //congratulations begins to fade again at midpoint
        //between opaque and transparent
        fill(h, s, b, t-255);
      } else {
        fill(h, s, b, t2);
        t2--;
      }
      text("Congratulations! You won!", width/2, height/2-tHeight/2);
      textSize(40);

      fill(h, s, b, t-510);
      text("Final score: "+points+"-("+shotsTaken+")*2 = "+fpoints, width/2, height/2-tHeight/2);
      //text("Placeholder text", width/2, height/2+tHeight/2);

      restart.display( width/2, height/2+(textAscent()+textDescent())/2);
      if (restart.pressed) {
        while (shots.size ()>0) {
          shots.remove(shots.size()-1);
        }
        shots.add(new Bullet());
        win=false;
        restart.pressed=false;
        points=0;
        t=0;
        t2=127.5;
        shotsTaken=0;

        //all animations run again if you win again
      }
    }
  }
}
