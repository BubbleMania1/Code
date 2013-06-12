class LevelSelect {
  Button back=new Button("Main Menu", color(180, 200, 255, 120), color(0, 0, 255, 150), color(255), color(255));
  Button[] select=new Button[totallevels];
  LevelSelect() {
    for (int i=0;i<select.length;i++) {
      select[i]=new Button(str(i), color(180, 200, 255, 120), color(0, 0, 255, 150), color(255), color(255));
    }
  }
  void display() {
    rectMode(CORNER);
    fill(132, 120, 255);
    rect(0, 0, width, height);
    fill(255);
    textSize(70);
    text("Level Select", width/2, (textAscent()+textDescent()/2));
    back.display(width/2, height/2+back.tHeight*3.6);
    if (back.pressed) {
      m.lSelect.pressed=false;
      back.pressed=false;
      m.credits.pressed=false;
    }
    for (int i=0;i<select.length;i++) {  

      select[i].display(4*i*select[0].rWidth+select[0].rWidth*13, select[i].tHeight+120); 
      if (select[i].pressed) {
        select[i].pressed=false;
        levelcounter=i;
        menu=false;
        m.lSelect.pressed=false;
      }
    }
  }
}
