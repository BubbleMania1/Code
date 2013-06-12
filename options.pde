class Options {
  float changed;
  Button songs[]=new Button[3];
  Button back=new Button("Main Menu", color(180, 200, 255, 120), color(0, 0, 255, 150), color(255), color(255));
  Options() {

    songs[0]=new Button("Popping Bubbles", color(180, 200, 255, 120), color(0, 0, 255, 150), color(255), color(255));
    songs[1]=new Button("All By Myself", color(180, 200, 255, 120), color(0, 0, 255, 150), color(255), color(255));
    songs[2]=new Button("Mute", color(180, 200, 255, 120), color(0, 0, 255, 150), color(255), color(255));
  }
  void display() {


    rectMode(CORNER);
    fill(132, 120, 255);
    rect(0, 0, width, height);
    fill(255);
    textSize(70);
    text("Options", width/2, (textAscent()+textDescent()/2));
    for (int i=0;i<songs.length;i++) {
      songs[i].display(width/2, width/2-songs[i].tHeight+songs[i].tHeight*i);
      if (songs[i].pressed) {
        changed++;
      }
    }
    for (int i=0;i<songs.length-1;i++) {
      //if any button besides mute is pressed
      if (songs[i].pressed) {
        songs[songs.length-1].pressed=false;
        muted=false;
      }
    }

    if (songs[0].pressed) {
      song="Dorapop.mp3";
      psong=song;
      songs[0].pressed=false;
    }
    if (songs[1].pressed) {
      song="All By Myself.mp3";
      psong=song;
      songs[1].pressed=false;
    }

    back.display(width/2, height-2*back.tHeight);
    if (back.pressed) {
      m.options.pressed=false;
      back.pressed=false;
      m.credits.pressed=false;
      m.instructions.pressed=false;
      m.start.pressed=false;
      m.lSelect.pressed=false;
    }
    if (player.isPlaying()==false) {
      return;
    }
    if (songs[2].pressed) {
      muted=true;
    }
  }
}
