int totallevels=1;
Level[] levels=new Level[totallevels];
int levelcounter;
ArrayList <Bullet>shots=new ArrayList<Bullet>();
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
  for (int i=0;i<levels.length;i++) {
    if (i==0) {
      levels[i]=new Level(48);
    } else {
      levels[i]=new Level(30);
      //each level has 30 balls;
    }
  }

  //testing;
  textSize(font);
  textAlign(CENTER, CENTER);
}
void draw() {

  if (menu) {
    s.angle=0;
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

    while (levels[levelcounter].balls.size ()>0) {
      levels[levelcounter].balls.remove(0);
    }
    levelcounter=0;
    //every time you are on the menu screen, 
    //level resets to 0 and all balls are removed
    //so they can be generated again when playing
  } else {
    //-------------------GLOBAL POINTS RECORD------------------------
    fpoints=points-shotsTaken*2;
    if (fpoints<50) {
      rank="Complete Loser";
    } else if (fpoints<100) {
      rank="Barely Competent";
    } else if (fpoints<200) {
      rank="Amateur";
    } else if (fpoints<300) {
      rank="Bubblemaniac";
    } else if (fpoints>9000) {
      rank="Paras Jha";
    }
    //insert pictures and music for rank
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


    //------------------------------interface display
    i.display();

    if (levels[levelcounter].balls.size()<1) {
      //this messes up level progression
      //change if statement to check for something else later
      levels[levelcounter].load=true;
    }
    for (int i=0;i<levels.length;i++) {
      if (levels[i].load==true) {
        levels[i].load=false;
        levels[i].update();

        for (int j=0;j<levels[levelcounter].balls.size();j++) {
          Bullet temp=(levels[levelcounter].balls.get(j));
          switch (levelcounter) {
          case 0:

            if (j<8) {
              switch(j) {
              case 0: 
                temp.x=width/2-50;
                temp.y=height/2;
                break;
              case 1:
                temp.x=width/2+50; 
                temp.y=height/2;
                break;

              case 2:
                temp.x=width/2-100;
                temp.y=height/2+50;
                break;
              case 3:
                temp.x=width/2-100+s.w;
                temp.y=height/2+50+s.w;

                break;
              case 4:
                temp.x=width/2-100+2*s.w;
                temp.y=height/2+50+1.5*s.w;

                break;
              case 5:
                temp.x=width/2-100+3*s.w;
                temp.y=height/2+50+1.5*s.w;  
                break;
              case 6:
                temp.x=width/2-100+4*s.w;
                temp.y=height/2+50+s.w;
                break;
              case 7:
                temp.x=width/2-100+5*s.w;
                temp.y=height/2+50;
                break;
              }
            } else if (j<28) {

              temp.x=(j-8)*s.w+s.w/2;
              temp.y=width/2-100;
            } else if (j<49) {
              temp.x=(j-28)*s.w+s.w/2;
              temp.y=width/2+200;
            }


            break;

          case 1:

            break;
          }
          levels[0].update2();
        }
      }
    }

    levels[levelcounter].display();

    //-------------------------------interface display

      quit=new Button("End Game", bu2.c, color(0, 0, 255, 150), color(255), color(255));
    quit.display( width*3/4, height-s.h/2);
    if (quit.pressed) {
      gameover=true;
    }

    main=new Button("Main Menu", bu2.c, color(0, 0, 255, 150), color(255), color(255));
    main.display(width/4, height-s.h/2);
    if (main.pressed&&gameover==false&&win==false) {
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
          bu.touch(shots, shots, bu1);
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
    if (shots.size()==0&&levels[levelcounter].balls.size()==0) {
      if (levelcounter==totallevels) {
        win=true;
      } else {
        levelcounter++;
      }
      //buggy right now because of ball load code
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
