ArrayList shots=new ArrayList();
Base b;
Shooter s;

void setup() {
  rectMode(CENTER);
  size(800, displayHeight-100);
  b=new Base();
  s=new Shooter();
  colorMode(HSB);
}
void draw() {

  background(150, 50, 255); 
  b.display();
  s.display();
  for (int i=0;i<shots.size();i++) {
    Bullet bu=(Bullet)shots.get(i);
    bu.display();
    bu.move();
    for (int j=0;j<shots.size();j++) {
      if (j!=i) {
        Bullet bu1=(Bullet)shots.get(j);
        bu.touch(bu, bu1);
      }
    }
  }
}
void keyPressed() {
  if (key==' ') {
    shots.add(new Bullet());
  }
}
