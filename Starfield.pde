Particle[] glitter = new Particle[500];
void setup()
{
  size(500, 500);
  for (int i = 0; i < glitter.length; i++)
  {
    glitter[i] = new NormalParticle();
  }
  glitter[0] = new OddballParticle();
  glitter[1] = new JumboParticle();
}
void draw()
{
  background(0);
  for (int i = 0; i < glitter.length; i++)
  {
    glitter[i].move();
    glitter[i].show();
  }
}

class NormalParticle implements Particle
{
  double myX, myY, mySpeed, myDir;
  int myColor;
  NormalParticle()
  {
    myColor = color((int)(Math.random()*255)+1, (int)(Math.random()*255)+1, (int)(Math.random()*255)+1);
    myX = 250;
    myY = 250;
    mySpeed = (Math.random()*3)+1;
    myDir = (Math.random()*2)*Math.PI;
  }
  public void move()
  {
    myX = myX + mySpeed * Math.cos(myDir);
    myY = myY + mySpeed * Math.sin(myDir);
    if((myX < 0) || (myX > 500))
      myX =  myY = 250;
    if((myY < 0) || (myY > 500))
      myY = myX = 250;
      
  }

  public void show()
  {
    fill(myColor);
    ellipse((float)myX, (float)myY, 10, 10);
  }
}
interface Particle
{
  public void move();
  public void show();
}
class OddballParticle implements Particle
{
  double myX, myY, mySpeed, myDir;
  int myColor;
  OddballParticle()
  {
    myColor = color((int)(Math.random()*255)+1, (int)(Math.random()*255)+1, (int)(Math.random()*255)+1);
    myX = 250;
    myY = 250;
    mySpeed = (Math.random()*3)+1;
    myDir = (Math.random()*2)*Math.PI;
  }
  public void move()
  {
    myX = myX + 3;
    if (myX > 500)
    myX = 250;
  }

  public void show()
  {
    fill(myColor);
    rect((float)myX, (float)myY, 30, 20);
  }
}
class JumboParticle extends NormalParticle//uses inheritance
{
   void show()
  {
    fill(255, 221, 225);
    ellipse((float)myX, (float)myY, 40, 40);
  }
}