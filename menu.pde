class Menu {
  float t, hue;
  Button start=new Button("Start Game", color(180, 200, 255, 120), color(0, 0, 255, 150), color(255), color(255));
  Button instructions=new Button("Instructions", color(180, 200, 255, 120), color(0, 0, 255, 150), color(255), color(255));
  Button credits=new Button("Credits", color(180, 200, 255, 120), color(0, 0, 255, 150), color(255), color(255));
  Instructions i=new Instructions();
  Credits c=new Credits();
  Ball b=new Ball();
  Menu() {
  }
  void display() {

    stroke(0, 0, 255, 255);

    background(132, 120, 255);
    b.display();
    textSize(100);
    fill(hue, 125, 255);

    text("BUBBLEKRAZE", width/2, height/2-(textAscent()+textDescent()));
    hue=(hue+1)%360;
    start.display(width/2, height/2);
    if (start.pressed) {
      menu=false;
      start.pressed=false;
    }

    if (credits.pressed==false) {
      instructions.display(width/2, height/2+1.2*instructions.tHeight);
    }
    if (instructions.pressed) {
      i.display();
    }


    //      fill(180, 200, 255, 120);
    //      rect(width/2, height/2, width, height);
    //      fill(255);
    //      text("Instructions", width/2, height/2-height*.25+instructions.tHeight);
    //      textSize(20);
    //      text("In Bubblemania, you control a cannon", width/2, height/2-height*.25+instructions.tHeight*2);

    //instructions will be new class
    if (instructions.pressed==false) {
      credits.display(width/2, height/2+2.4*credits.tHeight);
    }
    if (credits.pressed) {
      c.display();
    }
  }
}
