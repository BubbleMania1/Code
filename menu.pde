class Menu {
  float t, hue;
//for future reference, put menu display in another if statement withint menu so that it can be turned off without starting the game
//this is so that buttons on the menu screen can't be pressed when buttons on supscreens of the menu are pressed and overlap the original menu buttons which still exist, hidden underneath the new background
  Button start=new Button("Start Game", color(180, 200, 255, 120), color(0, 0, 255, 150), color(255), color(255));
  Button instructions=new Button("Instructions", color(180, 200, 255, 120), color(0, 0, 255, 150), color(255), color(255));
  Button credits=new Button("Credits", color(180, 200, 255, 120), color(0, 0, 255, 150), color(255), color(255));
  Button lSelect=new Button("Level Select", color(180, 200, 255, 120), color(0, 0, 255, 150), color(255), color(255));
  Button options=new Button("Options", color(180, 200, 255, 120), color(0, 0, 255, 150), color(255), color(255));
  Instructions i=new Instructions();
  Credits c=new Credits();
  LevelSelect l=new LevelSelect();
  Options o=new Options();
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
    if (start.pressed&&credits.pressed==false&&instructions.pressed==false&&options.pressed==false&&lSelect.pressed==false) {
      menu=false;
      start.pressed=false;
    }

    if (credits.pressed==false&&options.pressed==false) {
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
    if (instructions.pressed==false&&options.pressed==false) {
      credits.display(width/2, height/2+4.8*credits.tHeight);
    }
    if (credits.pressed&&options.pressed==false) {
      c.display();
    }
    if (credits.pressed==false&&instructions.pressed==false) {
      lSelect.display(width/2, height/2+2.4*credits.tHeight);
    }
    if (lSelect.pressed&&options.pressed==false) {
      l.display();
    }
    if (lSelect.pressed==false&&credits.pressed==false&&instructions.pressed==false) {
      options.display(width/2, height/2+3.6*credits.tHeight);
    }
    if(options.pressed){
      o.display();
    }
  }
}
