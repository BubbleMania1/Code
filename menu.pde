class Menu {
  float x, y, d, dspd, hue, ease=0.1, t;
  Button start=new Button("Start Game", color(180, 200, 255, 120), color(0, 0, 255, 150), color(255), color(255));
  Button instructions=new Button("Instructions", color(180, 200, 255, 120), color(0, 0, 255, 150), color(255), color(255));
  Menu() {
    x=width/2;
    y=height/2;
    d=57.5;
    dspd=0.5;
  }
  void display() {

    stroke(0, 0, 255, 255);
    background(132, 120, 255);
    textSize(100);
    fill(hue, 125, 255);
    text("BUBBLEMANIA", width/2, height/2-(textAscent()+textDescent()));
    fill(hue, 255, 255, 100);
    ellipse(x, y, d, d);
    x+=(mouseX-x)*ease;
    y+=(mouseY-y)*ease;
    hue=(hue+1)%360;
    d+=dspd;
    if (d>75||d<50) {
      dspd=-dspd;
    }
    start.display(width/2, height/2);
    instructions.display(width/2, height/2+1.2*instructions.tHeight);
    if (instructions.pressed) {
      textSize(100);
      text("Incomplete", width/2, height/2);
      instructions.pressed=false;
    }
    //      fill(180, 200, 255, 120);
    //      rect(width/2, height/2, width, height);
    //      fill(255);
    //      text("Instructions", width/2, height/2-height*.25+instructions.tHeight);
    //      textSize(20);
    //      text("In Bubblemania, you control a cannon", width/2, height/2-height*.25+instructions.tHeight*2);

    //instructions will be new class
    if (start.pressed) {
      menu=false;
      start.pressed=false;
    }
  }
}
