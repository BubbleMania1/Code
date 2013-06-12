class Bullet {
  float x, y, d, xspd, yspd, spd=10;
  color c;
  int n;
  //n=number for colors of balls
  int pspawn, ptype;
  int counter, touched;
  float x1, tint;
  int hue;
  //switch statements are in both constructor and void display
  //because background is dependant on ball color, and 
  //ball.display() happens after background
  //this would lead to a black screen the first frame
  //switch statement added to display method so that 
  //color could be changed after balls are declared
  Bullet() {
    n=int(random(1, 6));
    pspawn=int(random(1, 9));
    pspawn=1;
    //1/8 chance powerup
    if (pspawn==1) {
      ptype=int(random(1, 5));
      //4 powerup types
    }
    //    if (shots.size()>0) {
    //      Bullet bu1=shots.get(shots.size()-1);
    //      for (int i=0;i<shots.size()-1;i++) {
    //        Bullet bu2=shots.get(i);
    //        for (int j=0;j<levels[levelcounter].balls.size();j++) {
    //          Bullet bu3=levels[levelcounter].balls.get(j);
    //
    //          while (bu1.n!=bu2.n&&bu1.n!=bu3.n) {
    //            bu1.n=int(random(1, 6));
    //          }
    //        }
    //      }
    //    }

    //DOEN'T WORK RIGHT NOW ON ANY BALL
    //should make every new shot have to be one of the colors on screen
    //can compensate for not working when
    //shotsize()==0 with new update
    //function that runs before display and doesn't need to 
    //use if(shots.size()>0)

    //note: to make things less ridiculously difficult, I'm going to 
    //change n so that it can only equal whatever values are 
    //still on screen eventually
    //also balls shouldn't be able to float in mid-air later
    if (pspawn==1) {
      switch(ptype) {
      case 1:
        c=color(tint);
        tint=sin(radians(x1))*400;
        x1+=3;

        break;
      case 2:
        c=color(0, 255, 255, 120);
        break;
      case 3:
        c=color(hue, 255, 255, 120);
        hue=(hue+1)%360;
        break;
      case 4:
        c=color(tint);
      }
    } else {
      touched=0;
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
    }
    d=s.w;
    x=b.x;
    y=b.y;
  }

  void display() {  

    if (pspawn==1) {
      switch(ptype) {
      case 1:
        c=color(tint);
        tint=sin(radians(x1))*400;
        x1+=3;
        break;

      case 2:
        c=color(0, 255, 255, 120);
        break;
      case 3:
        c=color(hue, 255, 255, 120);
        hue=(hue+1)%360;
        break;
      case 4:
        c=color(tint);
      }
    } else {
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
    }

    stroke(255);
    fill(c);
    ellipse(x, y, d, d);
    if (pspawn==1) {
      if (ptype==4) {
        fill(255);
        text("?", x, y);
      }
    }
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
      if (ptype==4) {
        //ptype 4's ball expands rapidly
        //this prevents new ball from being added
        //before expansion is complete
        if (d/2>height) {
          move=false;
          shots.remove(this);
          shots.add(new Bullet());
        }
      } else {
        move=false;
        shots.add(new Bullet());
      }



      //every time the ball stops, a new ball is added to the cannon
    }
    if (x-d/2<0||x+d/2>width) {
      xspd=-xspd;
    }
  }
  void touch(ArrayList tarray, ArrayList tarray2, Bullet b1) {
    //top ball is b1, b1 is removed from first array
    //bottom ball is removed from tarray2
    if (b1.pspawn==1) {

      switch(b1.ptype) {
      case 1: 

        //explosion
        if (dist(b1.x, b1.y, x, y)<=b1.d/2+d/2) {
          b1.touched=1;
          b1.xspd=0;
          b1.yspd=0;
          tarray2.remove(this);
          points+=10;
        }
        if (b1.touched>0) {
          b1.d++;
        }
        if (b1.y-b1.d/2<=0) {
          b1.touched++;
        }
        if (b1.d>=4*s.w) {
          shots.remove(b1);
          touched=0;
        }
        break;
      case 2:

        //piercing
        if (dist(b1.x, b1.y, x, y)<s.w) {
          tarray2.remove(this);
          points+=10;
        }
        if (b1.y-s.w/2<=0) {
          shots.remove(b1);
        }
        //keep this in mind for penetrating ball
        break;
      case 3:
        //rainbow ball
        if (dist(b1.x, b1.y, x, y)<s.w) {
          shots.remove(b1);
          tarray2.remove(this);
          points+=10;
        }
        if (b1.y-s.w/2<=0) {
          b1.pspawn=2;
          //if rainbow ball touches ceiling, it turns into
          //a regular (non powerup) ball
        }
        break;
      case 4:

        //color randomizer
        if (b1.y-b1.d/2<=0) {
          b1.touched=1;
        }
        if (b1.touched>0) {
          b1.tint+=0.25;
          b1.d++;
        }
        if (b1.d/2>height) {
          for (int i=0;i<levels[levelcounter].balls.size();i++) {
            levels[levelcounter].balls.get(i).n=int(random(1, 6));
            touched=0;
          }
        }
        break;
      }
    } else {
      if (dist(b1.x, b1.y, x, y)<=b1.d/2+d/2&&b1.pspawn!=1) {
        b1.xspd=0;
        b1.yspd=0;
        if (b1.n==n) {
          tarray.remove(b1);
          tarray2.remove(this);
          points+=10;
        }
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
