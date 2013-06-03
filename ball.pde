class Ball {
  float x, y, d, dspd, hue, ease=0.1; 
  Ball() {
     x=width/2;
    y=height/2;
    d=57.5;
    dspd=0.5;
  }
  void display() {
    fill(hue, 255, 255, 100);
    ellipse(x, y, d, d);
    x+=(mouseX-x)*ease;
    y+=(mouseY-y)*ease;
    hue=(hue+1)%360;
    d+=dspd;
    if (d>75||d<50) {
      dspd=-dspd;
    }
  }
}
