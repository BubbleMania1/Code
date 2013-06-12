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
      stroke(132, 120, 255, 510-t);
      fill(132, 120, 255, 510-t);
      ellipse(b1.x, b1.y, b1.d*2, b1.d*2);
      //code to fade in ball
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
      fill(132, 120, 255, 510-t);
      rectMode(CENTER);
      stroke(132, 120, 255, 510-t);
      rect(restart.x, restart.y+.15*textAscent(), textWidth(restart.s)*13/9, restart.tHeight);
      //rectangle to allow play again to fade in
      if (restart.pressed) {
        while (shots.size ()>0) {
          shots.remove(shots.size()-1);
        }
        shots.add(new Bullet());
        //bullets shot removed, one added to cannon
        while (levels[levelcounter].balls.size ()>0) {
          levels[levelcounter].balls.remove(0);
        }
        levelcounter=1;
        //balls in current level removed
        win=false;
        restart.pressed=false;
        points=0;
        t=0;
        t2=127.5;
        shotsTaken=0;
        player.pause();
        song=dsong;
        //all animations run again if you win again
      }
    }
  }
}
