class Interface {
  Interface() {
  }
  void display() {
    stroke(255);
    rectMode(CORNER);
    fill(0, 0, 255, 120);
    rect(0, 0, width, height-s.h);
    //reduces saturation and darkness of background so balls are visible
    line(0, height-s.h, width, height-s.h);
    //border between lose area and game area located at top of cannon
    fill(0, 0, 255, 70);
    rect(0, height-s.h, width, s.h);
    //different transparencies for border areas
  }
}
