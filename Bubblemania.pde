int totallevels=8;
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
//2 points deducted per shot taken
import ddf.minim.*;
Minim minim;
AudioPlayer player;
String song="Dorapop.mp3";
String psong;
//psong stores previous song when song choice buttons pushed
//this is so game end songs can be reverted easily
boolean muted;
//-------------------------------------------------------------------

Button quit;
Button main;
//quit=end game, main=main menu
boolean menu=true;
Menu m;
Bullet bu2;
void setup() {

  minim=new Minim(this);
  player=minim.loadFile(song);
  colorMode(HSB);
  rectMode(CENTER);
  size(800, displayHeight-100);
  //optimal size(800,800);
  b=new Base();
  s=new Shooter();
  g=new Gameover();
  i=new Interface();
  w=new Won();
  m=new Menu();
  shots.add(new Bullet());


  levels[0]=new Level(28);
  levels[1]=new Level(48);
  levels[2]=new Level(42);
  levels[3]=new Level(19);
  levels[4]=new Level(22);
  levels[5]= new Level(41);
  levels[6]= new Level(30);
  levels[7]= new Level(85);
  //testing;
  textSize(font);
  textAlign(CENTER, CENTER);
  quit=new Button("End Game");
  main=new Button("Main Menu");
}
void draw() {
  if (m.o.changed==0&&m.o.songs[m.o.songs.length-1].pressed==false) {
    song="Dorapop.mp3";
  }
  for (int i=0;i<m.o.songs.length;i++) {
    if (m.o.changed>0.5) {
      player.pause();
      m.o.changed=0.5;
      //need to pause every time song switches
    }
  }

  if (muted==false) {
    if (player.isPlaying()==false&&gameover==false&&win==false) {
      player=minim.loadFile(song);
      player.play();
      player.loop();
    }
  }
  if (menu) {
    levelcounter=1;
    //every time you are on the menu screen, 
    //level resets to 1 and all balls are removed
    //so they can be generated again when playing
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
  } else {

    //-------------------GLOBAL POINTS RECORD------------------------
    fpoints=points-shotsTaken*2;

    if (fpoints<5000) {
      rank="Complete Loser";
      song="sadtrombone.mp3";
    } else if (fpoints<10000) {
      rank="Barely Competent";
      song="Que Sera.mp3";
    } else if (fpoints<20000) {
      rank="Amateur";
      song="wedidit.mp3";
    } else if (fpoints<30000) {
      rank="Bubblemaniac";
      song="champions.mp3";
    } 
    if (fpoints>90000) {
      rank="Paras Jha";
      song="Freddie.mp3";
    }

    //insert pictures and music for rank
    //-----------------------------------------------------------------

    if (shots.size()<1) {
      shots.add(new Bullet());
      move=false;
    }
    //above is to avoid freeze glitching for code like below
    //referencing shots.size()-1
    bu2=(Bullet)shots.get(shots.size()-1);

    background(bu2.c);

    //shots.size()>0 so that can't glitch out when all balls gone


    //------------------------------interface display
    i.display();

    if (levels[levelcounter].balls.size()<1&&win==false&&shots.size()<2) {
      //this messes up level progression
      //change if statement to check for something else later
      levels[levelcounter].load=true;
      //only updates when win is false and there are no balls on screen
      //not counting ball in cannon
    }

    for (int i=0;i<levels.length;i++) {
      if (levels[i].load==true) {
        levels[i].load=false;
        levels[i].update();

        for (int j=0;j<levels[levelcounter].balls.size();j++) {
          Bullet temp=(levels[levelcounter].balls.get(j));
          switch (levelcounter) {
          case 0:
            float dSpace=sqrt((float(width^2)+sq((height-s.h)))/60);
            float dAngle=atan((height-s.h)/width);
            float dX=dSpace*cos(dAngle);
            float dY=dSpace*sin(dAngle);
            if (j<12) {
              temp.x=j*dX+s.w/2;
              temp.y=j*dY+s.w/2;
            } else if (j<24) {
              temp.x=width-(j-12)*dX-s.w/2;
              temp.y=(j-12)*dY+s.w/2;
            }
            switch (j) {
            case 24: 
              temp.x=width/4;
              temp.y=(height-s.h)/2;
              break;
            case 25:
              temp.x=width/2;
              temp.y=(height-s.h)/4;
              break;
            case 26:
              temp.x=width*3/4;
              temp.y=(height-s.h)/2;
              break;
            case 27:
              temp.x=width/2;
              temp.y=(height-s.h)*3/4;
              break;
            }
            break;


          case 1:
            if (j<8) {
              switch(j) {
              case 0: 
                temp.x=width/2-50;
                temp.y=height/2-80;
                break;
              case 1:
                temp.x=width/2+50; 
                temp.y=height/2-80;
                break;

              case 2:
                temp.x=width/2-100;
                temp.y=height/2+50-80;
                break;
              case 3:
                temp.x=width/2-100+s.w;
                temp.y=height/2+50+s.w-80;

                break;
              case 4:
                temp.x=width/2-100+2*s.w;
                temp.y=height/2+50+1.5*s.w-80;

                break;
              case 5:
                temp.x=width/2-100+3*s.w;
                temp.y=height/2+50+1.5*s.w-80;  
                break;
              case 6:
                temp.x=width/2-100+4*s.w;
                temp.y=height/2+50+s.w-80;
                break;
              case 7:
                temp.x=width/2-100+5*s.w;
                temp.y=height/2+50-80;
                break;
              }
            } else if (j<28) {

              temp.x=(j-8)*s.w+s.w/2;
              temp.y=width/2-100-80;
            } else if (j<49) {
              temp.x=(j-28)*s.w+s.w/2;
              temp.y=width/2+200-80;
            }


            break;
          case 2:

            if (j<3) {
              temp.x= j*s.w+s.w/2;
              temp.y=j*s.w+s.w/2+500;
            } else if (j<11) {
              temp.x= (j-3)*s.w+s.w/2;
              temp.y=(j-3)*s.w+s.w/2+250;
            } else if (j<25) {
              temp.x= (j-11)*s.w+s.w/2;
              temp.y=(j-11)*s.w+s.w/2;
            } else if (j<35)
            {
              temp.x= (j-25)*s.w+s.w/2+250;
              temp.y=(j-25)*s.w+s.w/2;
            } else if (j<40) {
              temp.x= (j-35)*s.w+s.w/2+500;
              temp.y=(j-35)*s.w+s.w/2;
            } else if (j<42) {
              temp.x= (j-40)*s.w+s.w/2+710;
              temp.y=(j-40)*s.w+s.w/2;
            }
            break;
          case 3:
            if (j<19) {
              temp.x=j*s.w+s.w/2+30;
              temp.y=420;
            }
            break;
          case 4:
            if (j<6) {
              temp.x=j*s.w*3.5+s.w/2+30;
              temp.y= 150;
            } else if (j<11) {
              temp.x= (j-6)*s.w*3.5+s.w/2+100;
              temp.y= 300;
            } else if (j<17) {
              temp.x= (j-11)*s.w*3.5+s.w/2+30;
              temp.y= 450;
            } else if (j<22) {
              temp.x= (j-17)*s.w*3.5+s.w/2+100;
              temp.y= 600;
            }
            break;
          case 5:
            if (j<5) {
              temp.x=60;
              temp.y= j*s.w+s.w/2;
            } else if (j<17) {
              temp.x=230;
              temp.y= (j-5)*s.w+s.w/2;
            } else if (j<21) {
              temp.x=400;
              temp.y= (j-17)*s.w+s.w/2;
            } else if (j<30) {
              temp.x=570;
              temp.y= (j-21)*s.w+s.w/2;
            } else if (j<41) {
              temp.x=740;
              temp.y= (j-30)*s.w+s.w/2;
            }
            break;

          case 6:

            if ( j<11) {
              temp.x=j*s.w+s.w/2+180;
              temp.y=280;
            } else if (j<16) {
              temp.x=200;
              temp.y=(j-11)*s.w+s.w/2+300;
            } else if (j<26) {
              temp.x=(j-16)*s.w+s.w/2+220;
              temp.y=480;
            } else if (j<30) {
              temp.x=600;
              temp.y=(j-26)*s.w+s.w/2+300;
            }
            break;
          case 7:
            if ( j<19) {
              temp.x=j*s.w+s.w/2;
              temp.y=30;
            } else if (j<33) {
              temp.x=40-s.w/2;
              temp.y= (j-19)*s.w+s.w/2+50;
            } else if (j<47) {
              temp.x= 760-s.w/2;
              temp.y=(j-33)*s.w+s.w/2+50;
            } else if ( j<64) {
              temp.x=(j-47)*s.w+s.w/2+60-s.w/2;
              temp.y=590;
            } else if (j<69) {
              temp.x= (j-64)*s.w+s.w/2+200-s.w/2;
              temp.y=(j-64)*s.w+s.w/2+height/2-s.h;
            } else if (j<75) {
              temp.x=(j-70)*s.w+s.w/2+200+s.w*6-s.w/2; 
              temp.y=-(j-70)*s.w+s.w/2+height/2-s.h+4*s.w;
            } else if (j<80) {
              temp.x=(j-75)*s.w+s.w/2+200+s.w-s.w/2; 
              temp.y=-(j-75)*s.w+s.w/2+height/2-s.h-s.w;
            } else if (j<84) {
              temp.x= (j-80)*s.w+s.w/2+200+s.w*6-s.w/2;
              temp.y=(j-80)*s.w+s.w/2+height/2-s.h-s.w*4;
            }
            if (j==84) {
              temp.x=width/2;
              temp.y=(height-s.h)/2;
            }
          }
          levels[levelcounter].colorcheck();
          //can be put one bracket down if break is taken out
        }
      }
    }

    levels[levelcounter].display();

    //-------------------------------interface display


      quit.display( width*3/4, height-s.h/2, bu2.c, color(0, 0, 255, 150), color(255), color(255));
    if (quit.pressed) {
      gameover=true;
      quit.pressed=false;

      player.pause();
    }


    main.display(width/4, height-s.h/2, bu2.c, color(0, 0, 255, 150), color(255), color(255));
    if (main.pressed&&gameover==false&&win==false) {
      menu=true;
      main.pressed=false;
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
      if (bu3.y+bu3.d/2>height-s.h&&shots.get(shots.size()-1).pspawn!=1) {
        gameover=true;
        if (g.t==0 ){
          player.pause();
        }


        //game can't be over when powerup goes under line
        //shots.size()-1 so it doesn't count the ball inside the cannon
        //which would otherwise always fulfill the gameover condition
      }
    }
    if (shots.size()==0&&levels[levelcounter].balls.size()==0) {
      if (levelcounter==totallevels-1) {
        //totallevels-1 as first level is level 0
        win=true;
        if (w.t==0) {
          player.pause();
        }
      } else {
        if (levelcounter==0) {
          points=0;
        }
        levelcounter++;
      }
      //buggy right now because of ball load code
    }
    textSize(50);
    text(points, width/2, (height-s.h)/2);

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
