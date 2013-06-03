class Credits {
  float  tHeight, hue;
  Ball b=new Ball();
  Button back=new Button("Main Menu", color(180, 200, 255, 120), color(0, 0, 255, 150), color(255), color(255));
  Credits() {
  } 
  void  display() {

    rectMode(CORNER);
    fill(132, 120, 255);
    rect(0, 0, width, height);
    b.display();

    textSize(70);
    tHeight=textAscent()+textDescent();

    //fill(hue,255,255,120);
    fill(255);
    text("Credits", width/2, tHeight/2);
    hue=(hue+1)%360;
    textSize(40);
    text("Programmer: Alex Wu", width/2, 2*tHeight);
    text("QA Tester: Andrew Suri", width/2, 3*tHeight);
    text("UI designer: Yelena Kudryashova", width/2, 4*tHeight);
    text("Project manager: Pulkita Dua", width/2, 5*tHeight);
    back.display(width/2, 7*tHeight);
    //note: if button in same place as credits buton, will also activate when credits button pressed
    if (back.pressed) {
      m.credits.pressed=false;
      back.pressed=false;
    }
  }
}
