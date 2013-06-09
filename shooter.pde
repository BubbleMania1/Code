class Shooter {
  float x, y, w, h, angle, spd;
  Shooter() {
    x=b.x;
    y=b.y-b.d/2;
    spd=PI/180*2;
    //2 degrees per key press
    w=b.d*2/5;
    //note: processing can't handle numbers less than 1?
    //2/5*b.d=0 in processing; maybe 2/5 is handled as int?
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
    if (levelcounter==0) {
      //stroke(100, 255, 255);


      stroke(bu2.c);


      line(0, 0, 0, -height-h);

      //laser sight (perhaps add for powerup/first level later?)
      fill(0, 0, 255, 120);
      stroke(0,0,255,120);
      rect(0, -h-height, w, height*2);
    }
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
