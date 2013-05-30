ArrayList shots=new ArrayList();
Base b;
Shooter s;
boolean move=false;
//keeps track of if balls are moving
//only one ball can be shot at a time
boolean gameover=false;
boolean win=false;
void setup() {
  rectMode(CENTER);
  size(800, displayHeight-100);
  b=new Base();
  s=new Shooter();
  colorMode(HSB);
  shots.add(new Bullet());
  textSize(50);
  textAlign(CENTER,CENTER);
}
void draw() {
  rectMode(CORNER);
  if (shots.size()>0) {
    Bullet bu2=(Bullet)shots.get(shots.size()-1);
    background(bu2.c);
    //shots.size()>0 so that can't glitch out when all balls gone
  }
  //changes background to match shot color
  fill(0, 0, 255, 120);
  rect(0, 0, width, height-s.h);
  //reduces saturation and darkness of background so balls are visible
  line(0, height-s.h, width, height-s.h);
  //border between lose area and game area located at top of cannon
  fill(0, 0, 255, 70);
  rect(0, height-s.h, width, s.h);
  //different transparencies for border areas
  b.display();
  s.display();
  for (int i=0;i<shots.size();i++) {
    Bullet bu=(Bullet)shots.get(i);
    bu.display();
    for (int j=0;j<shots.size();j++) {
      if (j!=i) {
        Bullet bu1=(Bullet)shots.get(j);
        bu.touch(bu, bu1);
      }
    }
  }
  if (move==true) {
    if (shots.size()>0) {
      Bullet bu=(Bullet)shots.get(shots.size()-1);
      bu.move();
    }
  }
  for (int i=0;i<shots.size()-1;i++) {
    Bullet bu3=(Bullet)shots.get(i);
    if (bu3.y+bu3.d/2>height-s.h) {
      gameover=true;
      //shots.size()-1 so it doesn't count the ball inside the cannon
      //which would otherwise always fulfill the gameover condition
    }
  }
  if(shots.size()==0){
   win=true; 
  }
  if(win){
  background(255);
  text("You Win",width/2,height/2); 
  }
  if(gameover){
    background(0);
    text("You Lose",width/2,height/2);
  }
}
void keyPressed() {
  if (move==false) {
    if (key==' ') {
      Bullet bu=(Bullet)shots.get(shots.size()-1);
      bu.update();
      move=true;
    }
  }
}
