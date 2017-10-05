Particle [] one;

void setup()
{
  size(500,500);
  one = new Particle[600];
  for (int i = 0; i < one.length; i++)
  {
     one[i] = new NormalParticle();
     one[1] = new JumboParticle();
     one[2] = new OddballParticle();
  }
}
void draw()
{
  background(255);
  for (int i = 0; i < one.length; i++)
  {
     one[i].move();
     one[i].show();
  }
}
interface Particle
{
  public void move();
  public void show();
}
class NormalParticle implements Particle
{
  int myColor;
  double myX, myY, mySpeed, myAngle;
  NormalParticle()
  {
    myX = 250;
    myY = 250;
    mySpeed = (Math.random()*10);
    myAngle = (Math.random()*(2*Math.PI));
    myColor = 0;
  }
  void move()
  {
    myX = myX + (mySpeed * Math.cos(myAngle));
    myY = myY + (mySpeed * Math.sin(myAngle));
  }
  void show()
  {
    fill(myColor);
    noStroke();
    ellipse((float)myX,(float)myY,3,3);
  }
}
class OddballParticle implements Particle
{
  int myColor;
  double myX, myY, mySpeed;
  OddballParticle()
  {
    myColor = 255;
    myX = 0;
    myY = 50;
    mySpeed = 2;
  }
  void move()
  {
    myX = myX + mySpeed;
    myY = myY + (mySpeed + (int)(Math.random()*10-5));
  }
  void show()
  {
    fill(0,0,255);
    ellipse((float)myX,(float)myY,50,50);
  }
}

class JumboParticle extends NormalParticle
{
  void show()
  {
    fill(255,0,0);
    ellipse((float)myX,(float)myY,10,10);
  }
}