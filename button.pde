class Button {
  float tHeight, tWidth;
  color tc, bc, flashc, noflashc, border;
  //tc=textcolor bc=button color
  //flashc=hover color, noflashc=nonhovering color
  //tborder=button border color
  boolean hovered, pressed;
//note: can't use clicked to determine if released because that would mess up all other button code as main menu and end game buttons are declared inside draw loop
//so their hovered and pressed are reset each frame

  String s;
  float x, y;
  Button(String ts, color tbc, color tflashc, color tnoflashc, color tborder) {
    s=ts;
    bc=tbc;
    flashc=tflashc;
    noflashc=tnoflashc;
    border=tborder;
    tWidth=textWidth(s);
    tHeight=textAscent()+textDescent();
  }
  //string inside constructor so width and height can be referenced

  void display( float tx, float ty) {

    x=tx;
    y=ty;

    textSize(30);
    tHeight=textAscent()+textDescent();

    fill(bc);
    rectMode(CENTER);
    stroke(border);
    rect(x, y+.15*textAscent(), textWidth(s)*13/9, tHeight);
    //text not actually centered properly with CENTER,CENTER
    //so rectangle needs to be moved down
    //textWidth(s)*13/9 so that button is slightly longer than text
    if (mouseX<x+textWidth(s)/2*13/9&&mouseX>x-textWidth(s)/2*13/9&&mouseY>y-tHeight/2&&mouseY<y+tHeight/2) {
      hovered=true;
      tc=flashc;

      if (mousePressed) {
        pressed=true;
      }
    } 
    else {
      hovered=false;
      tc=noflashc;
    }
    fill(tc);
    text(s, x, y);
  }
}
