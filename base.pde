class Base {
  float x, y, d, hue;
  Base() {
    d=100;
    //base and cannon are proportional
    x=width/2;
    y=height;
  }
  void display() {
    //noStroke();
    stroke(255);  

    hue=(hue+1)%360;
 
    fill(hue, 255, 255, 120);
    ellipse(x, y, d, d);
    //color changing base
  }
}
