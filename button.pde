class Button {
  float tHeight, tWidth, rWidth;
  color tc, bc, flashc, noflashc, border;
  //tc=textcolor bc=button color
  //flashc=hover color, noflashc=nonhovering color
  //tborder=button border color
  boolean hovered, pressed;
  boolean clicked;
  //note:if re-using button class for future program, put all color paramaters
  //in display instead of constructor so only 1 constructor and one display is needed

    String s;
  float x, y;
  Button(String ts, color tbc, color tflashc, color tnoflashc, color tborder) {
    
    s=ts;
    bc=tbc;
    flashc=tflashc;
    noflashc=tnoflashc;
    border=tborder;
    rWidth=textWidth(s)*13/9;
    tWidth=textWidth(s);
    tHeight=textAscent()+textDescent();
  }
  //string inside constructor so width and height can be referenced
  Button(String ts) {
    s=ts;
  }
  void display(float x, float y, color bc, color flashc, color noflashc, color border) {


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
        clicked=true;
      }
      if (clicked==true&&mousePressed==false) {
        pressed=true;
        clicked=false;
      }
 
    } else {
      hovered=false;
      tc=noflashc;
    }
    fill(tc);
    text(s, x, y);
  }
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
        clicked=true;
      }
      if (clicked==true&&mousePressed==false) {
        pressed=true;
        clicked=false;
      }
    } else {
      hovered=false;
      tc=noflashc;
    }
    fill(tc);
    text(s, x, y);
  }
}
