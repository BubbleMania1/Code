ArrayList shots=new ArrayList();
Base b;
Shooter s;
boolean move=false;
//keeps track of if balls are moving
//only one ball can be shot at a time
boolean gameover=false;
boolean win=false;
Gameover g;
Interface i;
float font=50;
int points;
int shotsTaken;
//shotsTaken subtracts from score after winning
int fpoints;
//5 points deducted per shot taken
Won w;

void setup() {

  colorMode(HSB);
  rectMode(CENTER);
  size(800, displayHeight-100);
  b=new Base();
  s=new Shooter();
  g=new Gameover();
  i=new Interface();
  w=new Won();
  
  shots.add(new Bullet());
  textSize(font);
  textAlign(CENTER, CENTER);
}
void draw() {

  fpoints=points-shotsTaken*5;

  //rectMode(CORNER);
  if (shots.size()<1) {
    shots.add(new Bullet());
    move=false;
  }
  //above is to avoid freeze glitching for code like below
  //referencing shots.size()-1
  Bullet bu2=(Bullet)shots.get(shots.size()-1);
  background(bu2.c);
  //shots.size()>0 so that can't glitch out when all balls gone


  b.display();
  s.display();
  i.display();
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
  if (shots.size()==0) {
    win=true;
  }
  text(points, width/2, height/2);
  if (win) {
    //background(255);
    // text("You Win", width/2, height/2);a

    w.display();
  }
  if (gameover) {
    g.display();
  }
}
void keyPressed() {
  if (gameover==false&&win==false) {
    //can't shoot when gameover or win so that score can't
    //be changed afterwards
    if (move==false) {
      if (key==' ') {
        Bullet bu=(Bullet)shots.get(shots.size()-1);
        bu.update();
        move=true;
        shotsTaken++;
      }
    }
  }
}
