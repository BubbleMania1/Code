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
    back.display(width/2, 6*tHeight);
    if (back.pressed) {
      m.instructions.pressed=false; 
      back.pressed=false;
    }
    
    tutorial.display(width/2, 6.5*tHeight);
    if (tutorial.pressed) {
      t.display();
      
    }

  }
}
