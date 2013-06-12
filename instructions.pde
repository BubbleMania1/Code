class Instructions {
  float tHeight;
  Ball b=new Ball();
  Button back=new Button("Main Menu", color(180, 200, 255, 120), color(0, 0, 255, 150), color(255), color(255));
  Button tutorial=new Button("Tutorial", color(180, 200, 255, 120), color(0, 0, 255, 150), color(255), color(255));
  Tutorial t=new Tutorial();
  Instructions() {
  }
  void display() {
    rectMode(CORNER);
    fill(132, 120, 255);
    rect(0, 0, width, height);
    b.display();
    textSize(70);
    tHeight=textAscent()+textDescent();
    fill(255);
    text("Instructions", width/2, tHeight/2);
      textSize(20);
    text("In BubbleKraze, you control a cannon that shoots multicolored balls.",width/2,2*tHeight);
    text("There are 5 possible ball colors: green, orange, purple, blue, pink",width/2,2.5*tHeight);
    text("Use the left and right arrow keys to change the angle of the cannon",width/2,3*tHeight);
    text("The up arrow key will reset the position of the cannon",width/2,3.5*tHeight);
    text("Press the spacebar to shoot the balls out of the screen",width/2,4*tHeight);
    text("Balls bounce off the side walls",width/2,4.5*tHeight);
    text("Balls of the same color will stick to one another after colliding",width/2,5*tHeight);
    text("Two balls of the same color will pop after colliding",width/2,5.5*tHeight);
    text("Try to make the balls disappear as quickly as you can",width/2,6*tHeight);
    text("For every ball popped, you earn 10 points, and for every shot taken, you lose 2.",width/2,6.5*tHeight);
    text("There are 4 powerups! One pierces, another explodes,",width/2,7*tHeight);
    text("the third is always a match, and the last switches things up",width/2,7.5*tHeight);
    
    back.display(width/2, 8*tHeight);
    if (back.pressed) {
      m.instructions.pressed=false; 
      back.pressed=false;
    }

    tutorial.display(width/2, 8.5*tHeight);
    if (tutorial.pressed) {

      levelcounter=0;
      menu=false;

      m.i.tutorial.pressed=false;
      m.instructions.pressed=false;
    } else {
      t.sh.angle=0;
    }
  }
}
