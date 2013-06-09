class Gameover {
  float t;
  //t=transparency of background
  float x, y, y1;
  //y1=controls transparency of background and "Try again"
  boolean touch;
  //checks if "try again" is hovered over;


  Button restart=new Button("Try Again?", color(0, 0, 255, 70), color( 0, 0, 255), color(0, 0, 255, 70), color(255));

  Gameover() {
  }
  void display() {

    if (keyPressed&&key==ENTER) {
      t=255;
      //skips fade animation
    }

    noStroke();
    rectMode(CORNER);

    fill(0, 0, 0, t);
    rect(0, 0, width, height);
    t++;

    if (t>255) {
      //only starts after background completely fades in
      y=sin(radians(x))*200;
      y1=sin(radians(x)-PI)*200;
      x+=1.5;
      fill(0, 0, 255, t-255);
      text("Rank: "+rank, width/2, height/2-4*(textAscent()+textDescent()));

      fill(0, 0, 255, y);
      textSize(50);
      text("You lose", width/2, height/2-(textAscent()+textDescent()));

      fill(0, 0, 255, y1);
      text("Better luck next time", width/2, height/2-(textAscent()+textDescent()));

      fill(0, 0, 255, t-255);
      textSize(30);
      text("Final score: "+points+"-("+shotsTaken+")*2 = "+fpoints, width/2, height/2-.2*restart.tHeight);
      restart.display( width/2, height/2+restart.tHeight);

      stroke(0, 0, 0, 510-g.t);
      fill(0, 0, 0, 510-g.t); 
      rect(restart.x, restart.y+.15*textAscent(), textWidth(restart.s)*13/9, restart.tHeight);
      //rectangle that allows fade in of button
      //510-g.t so that it starts becoming transparent
      //after the gameover screen completely fades in


      if (restart.pressed) {
        while (shots.size ()>0) {
          shots.remove(shots.size()-1);
        }
        shots.add(new Bullet());
        //bullets shot removed, one more added in cannon
        while (levels[levelcounter].balls.size ()>0) {
          levels[levelcounter].balls.remove(0);
        }
        levelcounter=1;
        //balls in current level removed
        t=0;
        x=0;
        gameover=false;
        restart.pressed=false;
        points=0;
        shotsTaken=0;

        //all animations run again if you lose sgain
      }
    }
  }
}
