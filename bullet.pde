class Bullet {
  float x, y, d, xspd, yspd, spd=10;
  color c;
  int n;
  //n=number for colors of balls
  int counter;
  //switch statements are in both constructor and void display
  //because background is dependant on ball color, and 
  //ball.display() happens after background
  //this would lead to a black screen the first frame
  //switch statement added to display method so that 
  //color could be changed after balls are declared
  Bullet() {
    n=int(random(1, 6));

    //note: to make things less ridiculously difficult, I'm going to 
    //change n so that it can only equal whatever values are 
    //still on screen eventually
    //also balls shouldn't be able to float in mid-air later
    switch(n) {
    case 1: 
      c=color(228, 147, 255); 
      //pink
      break;

    case 2: 

      c=color(145, 140, 255); 
      //blue
      break;

    case 3: 

      c=color(200, 150, 255);
      //purple
      break;

    case 4: 

      c=color(20, 170, 255); 
      //orange
      break;

    case 5: 

      c=color(84, 143, 255);
      //green
      break;
    }


    d=s.w;
    x=b.x;
    y=b.y;
  }
  void display() {  
    switch(n) {
    case 1: 
      c=color(228, 147, 255); 
      //pink
      break;

    case 2: 

      c=color(145, 140, 255); 
      //blue
      break;

    case 3: 

      c=color(200, 150, 255);
      //purple
      break;

    case 4: 

      c=color(20, 170, 255); 
      //orange
      break;

    case 5: 

      c=color(84, 143, 255);
      //green
      break;
    }

    stroke(255);
    fill(c);
    ellipse(x, y, d, d);
  }
  void move() {
    x+=xspd;
    y-=yspd;
    if (y-d/2<=0) {
      yspd=0;
      xspd=0;
      y=d/2;
      //balls can't go through ceiling
    }
    if (yspd==0&&xspd==0) {
      move=false;
      shots.add(new Bullet());
      //every time the ball stops, a new ball is added to the cannon
    }
    if (x-d/2<0||x+d/2>width) {
      xspd=-xspd;
    }
  }
  void touch(ArrayList tarray, ArrayList tarray2, Bullet b1) {
    //top ball is b1, b1 is removed from first array
    //bottom ball is removed from tarray2
    if (dist(b1.x, b1.y, x, y)<b1.d/2+d/2) {

      //y=bu=bullet above (relatively) other one



      //use trig later





      b1.xspd=0;
      b1.yspd=0;
      if (b1.n==n) {
        tarray.remove(b1);

        tarray2.remove(this);
        points+=10;
      }
    }
  }
  void update() {
    xspd=cos(PI/2-s.angle)*spd;
    yspd=sin(PI/2-s.angle)*spd;
    //adjusts angle of ball to match cannon
    //exists so that ball position is changed only once
    //so if cannon moves after shot, won't affect ball
  }
}
