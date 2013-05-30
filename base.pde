class Base {
  float x, y, d, hue;
  Base() {
    d=100;
    x=width/2;
    y=height;
  }
  void display() {
    //noStroke();
  stroke(255);  

    hue++;
    if (hue>360) {
      hue=0;
    }
    fill(hue, 255, 255,120);
    ellipse(x, y, d, d);
    //color changing base
  }
}
