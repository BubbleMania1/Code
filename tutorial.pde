//NO LONGER NECESSARY

































class Tutorial {
  float tHeight;
  Ball b=new Ball();
  Button back=new Button("Main Menu", color(180, 200, 255, 120), color(0, 0, 255, 150), color(255), color(255));
  Button instructions=new Button("Instructions", color(180, 200, 255, 120), color(0, 0, 255, 150), color(255), color(255));
  Interface i=new Interface();
  Base ba=new Base();
  Shooter sh=new Shooter();

  Tutorial() {
  }
  void display() {
    rectMode(CORNER);
    fill(132, 120, 255);
    rect(0, 0, width, height);
    i.display();
    //trying to simulate game environment within tutorial
    b.display();

    textSize(70);
    tHeight=textAscent()+textDescent();
    fill(255);
    text("Tutorial", width/2, tHeight/2);
    text("Under Construction",width/2,tHeight*2);
    back.display(width/4, height-s.h/2);
    instructions.display(width*3/4, height-s.h/2);
    if (back.pressed) {
      m.i.tutorial.pressed=false; 
      back.pressed=false;
      m.instructions.pressed=false;
    }
    if (instructions.pressed) {
      m.i.tutorial.pressed=false;
      instructions.pressed=false;
    }
    ba.display();
    sh.display();
  }
}
//note: possibly hard to implement, may take out of game
