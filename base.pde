class Base {
  float x, y, d, hue;
  Base() {
    d=100;
    x=width/2;
    y=height;
  }
  void display() {
    noStroke();
    hue = (hue + 1) % 360; // make sure hue doesn't exceed 360
    fill(hue, 255, 255,120);
    ellipse(x, y, d, d);
    //color changing base
  }
}
