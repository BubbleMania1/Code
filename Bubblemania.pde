ArrayList shots=new ArrayList();
Base b;
Shooter s;
boolean move=false;
//keeps track of if balls are moving
//only one ball can be shot at a time
void setup() {
  rectMode(CENTER);
  size(800, displayHeight-100);
  b=new Base();
  s=new Shooter();
  colorMode(HSB);
  shots.add(new Bullet());
}
void draw() {

  background(150, 50, 255); 
  b.display();
  s.display();
  for (int i=0;i<shots.size();i++) {
    Bullet bu=(Bullet)shots.get(i);
    bu.display();
    //bu.move();
    for (int j=0;j<shots.size();j++) {
      if (j!=i) {
        Bullet bu1=(Bullet)shots.get(j);
        bu.touch(bu, bu1);
      }
    }
  }
  if (move==true) {
    Bullet bu=(Bullet)shots.get(shots.size()-1);
    bu.move();
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
