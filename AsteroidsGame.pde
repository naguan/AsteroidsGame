private SpaceShip steve;
private Stars[] joe;
private ArrayList<Asteroid> larry;
private ArrayList<Bullet> bob;
private boolean wPress = false;
private boolean aPress = false;
private boolean sPress = false;
private boolean dPress = false;
private boolean spacePress = false;
private boolean ready = false;
public void setup() 
{
  background(0);
  size(700, 700);
  steve = new SpaceShip(350, 350);
  joe = new Stars[(int)(Math.random()*200)+100];
  larry = new ArrayList<Asteroid>();
  bob = new ArrayList<Bullet>();
  for ( int i = 0; i<joe.length; i++)
  {
    joe[i] = new Stars((int)(Math.random()*700), (int)(Math.random()*700));
  }
  for ( int i = 0; i< (int)(Math.random()*10)+10; i++)
  {
    larry.add(i, new Asteroid());
  }
}
public void draw() 
{
  background(0); 
  for (int i = 0; i<joe.length; i++)
  {
    joe[i].show();
  }
  for (int i = 0; i<larry.size (); i++)
  {
    larry.get(i).show();
    larry.get(i).move();
  }
  for (int i = 0; i<bob.size (); i++)
  {
    bob.get(i).show();
    bob.get(i).move();

    for (int d = 0; d<larry.size (); d++)
    {
      if ( dist(larry.get(d).getX(), larry.get(d).getY(), bob.get(i).getX(), bob.get(i).getY()) < 15)
      {

        larry.remove(d);
        bob.remove(i);
        break;
      }
    }
  }

  for (int i = 0; i<bob.size (); i++)
  {
    if (bob.get(i).getX() > 680 || bob.get(i).getX() < 20 || bob.get(i).getY() > 680 || bob.get(i).getY() < 20)
    {
      bob.remove(i);
      break;
    }
  }


  steve.show();
  steve.move();
  if (keyPressed == true)
  {
    if (key == 'd')
    {
      steve.rotate(10);
    }
    if (key == 'a')
    {
      steve.rotate(-10);
    }
    if (key == 'w')
    {
      steve.accelerate(0.1);
    }
    if (key == 's')
    {
      steve.accelerate(-0.1);
    } 
   

  }
  if (wPress == true && dPress == true && spacePress == true)
  {
    steve.rotate(5);
    steve.accelerate(0.05);
    bob.add(new Bullet(steve));
  }
  if (wPress == true && aPress == true && spacePress == true)
  {
    steve.rotate(-5);
    steve.accelerate(0.05);
    bob.add(new Bullet(steve));
  }
  if (sPress == true && dPress == true && spacePress == true)
  {
    steve.rotate(5);
    steve.accelerate(-0.05);
    bob.add(new Bullet(steve));
  }
  if (sPress == true && aPress == true && spacePress == true)
  {
    steve.rotate(-5);
    steve.accelerate(-0.05);
    bob.add(new Bullet(steve));
  }

  if (aPress == true && spacePress == true)
  {
    steve.rotate(5);
    bob.add(new Bullet(steve));
  }
  if (dPress == true && spacePress == true)
  {
    steve.rotate(-2);
    bob.add(new Bullet(steve));
  }
  if (sPress == true && dPress == true)
  {
    steve.rotate(2);
    steve.accelerate(-0.05);
  }
  if (sPress == true && aPress == true)
  {
    steve.rotate(-2);
    steve.accelerate(-0.05);
  }
  spacePress = false;
}  

public void keyPressed() {
  if (key == 'z')
  {
    steve.setX((int)(Math.random()*500)); 
    steve.setY((int)(Math.random()*500));
    steve.setPointDirection((int)(Math.random()*360));
    steve.setDirectionX(0);
    steve.setDirectionY(0);
  }
  if (key=='w')
  {
    wPress = true;
  } else if (key == 'a')
  {
    aPress = true;
  } else if (key == 's')
  {
    sPress = true;
  } else if (key == 'd')
  {
    dPress = true;
  } else if (key == ' ')
  {
    spacePress = true;
  }
  if (key == 'm')
  {
    larry.add(new Asteroid());
  }
   if( key == ' ' )
  {
    bob.add(new Bullet(steve));
  }  
}

public void keyReleased()
{
  if (key=='w')
  {
    wPress = false;
  } else if (key == 'a')
  {
    aPress = false;
  } else if (key == 's')
  {
    sPress = false;
  } else if (key == 'd')
  {
    dPress = false;
  }
}
class Bullet extends Floater
{
  private double dRadians; 
  public Bullet(SpaceShip steve) 
  {
    myColor = 255; 
    dRadians =steve.myPointDirection*(Math.PI/180); 
    myCenterX=steve.getX(); 
    myCenterY=steve.getY(); 
    myPointDirection=steve.getPointDirection(); 
    myDirectionX= 5 * Math.cos(dRadians) + steve.getDirectionX(); 
    myDirectionY= 5 * Math.sin(dRadians) + steve.getDirectionY();
  }
  public void show()
  {
    fill(myColor); 
    ellipse((int)myCenterX, (int)myCenterY, 10, 10);
  }
  public void setX(int x)
  {
    myCenterX = x;
  }
  public int getX() 
  {
    return (int)myCenterX;
  }
  public void setY(int y) {
    myCenterY = y;
  }
  public int getY() {
    return (int)myCenterY;
  }
  public void setDirectionX(double x) {
    myDirectionX = x;
  }
  public double getDirectionX() {
    return (int)myDirectionX;
  }
  public void setDirectionY(double y) {
    myDirectionY = y;
  }
  public double getDirectionY() {
    return (int)myDirectionY;
  }
  public void setPointDirection(int degrees) {
    myPointDirection = degrees;
  }
  public double getPointDirection() {
    return (int)myPointDirection;
  }
}





class Asteroid extends Floater
{
  private int rotSpd; 
  public Asteroid()
  {
    rotSpd = 5; 
    corners = 6; 
    xCorners = new int[corners]; 
    yCorners = new int[corners]; 
    xCorners[0]=18; 
    yCorners[0]=0; 
    xCorners[1]=12; 
    yCorners[1]=12; 
    xCorners[2]=-6; 
    yCorners[2]=12; 
    xCorners[3]=-18; 
    yCorners[3]=0; 
    xCorners[4]=-6; 
    yCorners[4]=-12; 
    xCorners[5]=18; 
    yCorners[5]=-12; 
    myColor = 175; 
    myCenterX=(int)(Math.random()*700); 
    myCenterY=(int)(Math.random()*700); 
    myDirectionX=(int)(Math.random()*4)-2; 
    myDirectionY=(int)(Math.random()*4)-2; 
    myPointDirection=(int)(Math.random()*360);
  }
  public void move()
  {
    rotate(rotSpd); 
    super.move();
  }
  public void setX(int x) {
    myCenterX = x;
  }
  public int getX() {
    return (int)myCenterX;
  }
  public void setY(int y) {
    myCenterY = y;
  }
  public int getY() {
    return (int)myCenterY;
  }
  public void setDirectionX(double x) {
    myDirectionX = x;
  }
  public double getDirectionX() {
    return (int)myDirectionX;
  }
  public void setDirectionY(double y) {
    myDirectionY = y;
  }
  public double getDirectionY() {
    return (int)myDirectionY;
  }
  public void setPointDirection(int degrees) {
    myPointDirection = degrees;
  }
  public double getPointDirection() {
    return (int)myPointDirection;
  }
}
class Stars 
{
  private int myX, myY; 
  public Stars(int x, int y)
  {
    myX = x; 
    myY = y;
  }
  public void show()
  {
    ellipse(myX, myY, 2, 2);
  }
}
class SpaceShip extends Floater  
{   
  public SpaceShip(int x, int y) {
    corners = 4; 
    xCorners = new int[corners]; 
    yCorners = new int[corners]; 
    xCorners[0]=-8; 
    yCorners[0]=-8; 
    xCorners[1]=16; 
    yCorners[1]=0; 
    xCorners[2]=-8; 
    yCorners[2]=8; 
    xCorners[3]=-16; 
    yCorners[3]=0; 
    myColor = 255; 
    myCenterX=x; 
    myCenterY=y; 
    myDirectionX=0; 
    myDirectionY=0; 
    myPointDirection=0;
  }
  public void setX(int x) {
    myCenterX = x;
  }
  public int getX() {
    return (int)myCenterX;
  }
  public void setY(int y) {
    myCenterY = y;
  }
  public int getY() {
    return (int)myCenterY;
  }
  public void setDirectionX(double x) {
    myDirectionX = x;
  }
  public double getDirectionX() {
    return (int)myDirectionX;
  }
  public void setDirectionY(double y) {
    myDirectionY = y;
  }
  public double getDirectionY() {
    return (int)myDirectionY;
  }
  public void setPointDirection(int degrees) {
    myPointDirection = degrees;
  }
  public double getPointDirection() {
    return (int)myPointDirection;
  }
}

abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners; //the number of corners, a triangular floater has 3   
  protected int[] xCorners; 
  protected int[] yCorners; 
  protected int myColor; 
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x); 
  abstract public int getX(); 
  abstract public void setY(int y); 
  abstract public int getY(); 
  abstract public void setDirectionX(double x); 
  abstract public double getDirectionX(); 
  abstract public void setDirectionY(double y); 
  abstract public double getDirectionY(); 
  abstract public void setPointDirection(int degrees); 
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180); 
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians)); 
    myDirectionY += ((dAmount) * Math.sin(dRadians));
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX; 
    myCenterY += myDirectionY; 

    //wrap around screen    
    if (myCenterX >width)
    {     
      myCenterX = 0;
    } else if (myCenterX<0)
    {     
      myCenterX = width;
    }    
    if (myCenterY >height)
    {    
      myCenterY = 0;
    } else if (myCenterY < 0)
    {     
      myCenterY = height;
    }
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor); 
    stroke(myColor); 
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180); 
    int xRotatedTranslated, yRotatedTranslated; 
    beginShape(); 
    for (int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX); 
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY); 
      vertex(xRotatedTranslated, yRotatedTranslated);
    }   
    endShape(CLOSE);
  }
} 
