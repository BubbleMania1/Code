ArrayList shots=new ArrayList();
Base b;
Shooter s;
boolean move=false;
//keeps track of if balls are moving
//only one ball can be shot at a time
//---------------------------WIN/LOSE------------------------------
boolean gameover=false;

boolean win=false;
Won w;  

Gameover g;
//-------------------------------------------------------------------
Interface i;
float font=50;
//---------------------------POINT STUFF--------------------------
String rank;
int points;
int shotsTaken;
//shotsTaken subtracts from score after winning
int fpoints;
//5 points deducted per shot taken
//-------------------------------------------------------------------

Button quit;
Button main;
//quit=end game, main=main menu
boolean menu=true;
Menu m;
void setup() {

  colorMode(HSB);
  rectMode(CENTER);
  size(800, displayHeight-100);
  b=new Base();
  s=new Shooter();
  g=new Gameover();
  i=new Interface();
  w=new Won();
  m=new Menu();
  shots.add(new Bullet());
  textSize(font);
  textAlign(CENTER, CENTER);
}
void draw() {

  if (menu) {
    m.display();
    shotsTaken=0;
    points=0;
    while (shots.size ()>0) {
      shots.remove(shots.size()-1);
    }
    shots.add(new Bullet());
    //separate add statement so that shot bullets will be removed 
    //and new one added in cannon
    move=false;
  } else {
    //-------------------GLOBAL POINTS RECORD------------------------
    fpoints=points-shotsTaken*2;
    if (fpoints<50) {
      rank="Complete Loser";
    } else if (fpoints<100) {
      rank="Barely Competent";
    } else if (fpoints<200) {
      rank="Amateur";
    }
    //-----------------------------------------------------------------

    if (shots.size()<1) {
      shots.add(new Bullet());
      move=false;
    }
    //above is to avoid freeze glitching for code like below
    //referencing shots.size()-1
    Bullet bu2=(Bullet)shots.get(shots.size()-1);
    background(bu2.c);

    //shots.size()>0 so that can't glitch out when all balls gone



    i.display();

    quit=new Button("End Game", bu2.c, color(0, 0, 255, 150), color(255), color(255));
    quit.display( width*3/4, height-s.h/2);
    if (quit.pressed) {
      gameover=true;
    }

    main=new Button("Main Menu", bu2.c, color(0, 0, 255, 150), color(255), color(255));
    main.display(width/4, height-s.h/2);
    if (main.pressed) {
      menu=true;
    }
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
    if (shots.size()==0) {
      win=true;
    }
    textSize(50);
    text(points, width/2, height/2);

    if (win) {
      w.display();
      if (w.t>255) {
        s.angle=0;
        //cannon resets after fade
      } 
    }
    if (gameover) {
      g.display();
      if (g.t>255) {
        s.angle=0;
        //cannon resets after fade
      }
    }
  }
}
void keyPressed() {
  if (gameover==false&&win==false&&menu==false) {
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
