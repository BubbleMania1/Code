class Shooter {
  float x, y, w, h, angle, spd;
  Shooter() {
    x=b.x;
    y=b.y-b.d/2;
    spd=PI/180*2;
    //2 degrees per key press
    w=40;
    h=b.d;
  }
  void display() {
    rectMode(CENTER);
    pushMatrix();
    translate(x, y+b.d/2);
    //origin at base of cannon
    rotate(angle);
    if (angle>PI/2-20*PI/180) {
      angle=PI/2-20*PI/180;
    }
    if (angle<-PI/2+20*PI/180) {
      angle=-PI/2+20*PI/180;
    }
    //constrains angle to 20 degrees above horizontal

    rect( 0, -b.d/2, w, h);

    stroke(100, 255, 255);
    line(0, 0, 0, -height);
    //laser sight (perhaps add for powerup/first level later?)

    popMatrix();
    if (keyPressed) {
      if (key==CODED) {
        if (keyCode==RIGHT) {
          angle+=spd;
        } 
        if (keyCode==LEFT) {
          angle-=spd;
        }
        if (keyCode==UP) {
          angle=0;
        }
      }
    }
  }
}
