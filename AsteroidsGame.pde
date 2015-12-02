private SpaceShip galaxy;
//private Asteroids bob;
ArrayList <Asteroids> theList;
//Asteroids [] asteriod;
Star [] starList; 
public void setup() 
  {
    galaxy = new SpaceShip();
    size(512, 512);
    starList = new Star [200];
   // asteriod = new Asteroids[20];
    for(int i=0; i< starList.length; i++){
        starList[i]= new Star(); 
    }
    theList = new ArrayList <Asteroids>();
     for(int i=0; i< 25; i++){
    Asteroids someAst = new Asteroids();
    theList.add(someAst);
    }
    
    
    /*for(int i=0; i< asteriod.length; i++){
        asteriod[i]= new Asteroids(); 
    }
    //bob = new Asteroids();*/

  }
public void draw() 
  {
    background(200,200,200);
    galaxy.move();
    galaxy.show();
    for(int i=0 ; i<starList.length; i++){
      starList[i].show();
    }
   for(int i=0; i< theList.size(); i++){
       Asteroids someAst = theList.get(i);

        someAst.show(); 
        someAst.move(); 
      
    }
   
  }
public void keyPressed(){
  if(keyCode==38)//up
      {
        
        galaxy.accelerate(.05);
        // background(0);
      } 
  if(keyCode==40)//down
       {
        
        galaxy.accelerate(-.05);
        // background(0);
       } 
    
  if(keyCode==37)//left
      {
        galaxy.rotate(-20);
        //background(0);
      }
  
  if(keyCode==39)//right
      {
       galaxy.rotate(20);
       //background(0);
      }
  if (keyCode==32)//spacebar
      {
        galaxy.setX(220);
        galaxy.setY(220);
        galaxy.setPointDirection(0);
        //background(0);
      }  
      if(keyCode==65){
      fill(255,0,0);
      ellipse((galaxy.getX()), (galaxy.getY()), 50, 50);
      int x=galaxy.getX();
      int y = galaxy.getY();
     // double xi= galaxy.getDirectionX();
      //x+=xi;
      //x++;
      //y++;
    }
  
}
public class Asteroids extends Floater {
    protected  int rotSpeed;
    protected double rand;
    public Asteroids(){
      corners = 4;
      xCorners = new int[corners];
      yCorners = new int[corners];
      xCorners[0] = 0;
      yCorners[0] = -16;
      xCorners[1] = -8;
      yCorners[1] = 0;
      xCorners[2] = 0;
      yCorners[2] = 16;
      xCorners[3] = 8;
      yCorners[3] = 0;

      myCenterX= (int)((Math.random()*500)+6);
      myCenterY=(int)((Math.random()*500)+6);
      myPointDirection= 0;
      //myDirectionX= Math.random()*0.1;
      //myDirectionY= Math.random()*0.1;
      myColor= color(0,191,255);
      rand=(Math.random()*1);
      if(rand<=.5)
      {
        rotSpeed= ((int)(Math.random()*5)+1);
      }
      if(rand>=.5)
      {
        rotSpeed= ((int)((Math.random()*5)-6));
      }
for(int i=0; i< theList.size(); i++){
      if(get((int)myCenterX,(int)myCenterY)==color(255,255,255)){
        theList.remove(i);
      }
}   


    }
    public void setX(int x){myCenterX=x;}  
    public int getX(){return (int)myCenterX;}  
    public void setY(int y){myCenterY=y;}   
    public int getY(){return (int)myCenterY;} 
    public void setDirectionX(double x){myDirectionX=x;}   
    public double getDirectionX(){return (int)myDirectionX;}   
    public void setDirectionY(double y){myDirectionY=y;}  
    public double getDirectionY(){return (int)myDirectionY;}    
    public void setPointDirection(int degrees){myPointDirection=degrees;}   
    public double getPointDirection(){return myPointDirection;} 

    public void move ()   //move the floater in the current direction of travel
      {      
        rotate(rotSpeed);
        super.move();
      }
   /* public void rotate(double rotspeed) {
        
        myPointDirection+=rotspeed;
         
       }   */

}

public class SpaceShip extends Floater  
  {   
    public SpaceShip(){
      corners = 4;
      xCorners = new int[corners];
      yCorners = new int[corners];
      xCorners[0] = -8;
      yCorners[0] = -8;
      xCorners[1] = 16;
      yCorners[1] = 0;
      xCorners[2] = -8;
      yCorners[2] = 8;
      xCorners[3] = -4;
      yCorners[3] = 0;
     

      myCenterX= 198;
      myCenterY=198;
      myPointDirection= 0;
      myDirectionX= 0.1;
      myDirectionY= 0.1;
      myColor= color(255,255,255);
    }
      public void setX(int x){myCenterX=x;}  
      public int getX(){return (int)myCenterX;}  
      public void setY(int y){myCenterY=y;}   
      public int getY(){return (int)myCenterY;} 
      public void setDirectionX(double x){myDirectionX=x;}   
      public double getDirectionX(){return (int)myDirectionX;}   
      public void setDirectionY(double y){myDirectionY=y;}  
      public double getDirectionY(){return (int)myDirectionY;}    
      public void setPointDirection(int degrees){myPointDirection=degrees;}   
      public double getPointDirection(){return myPointDirection;}
      
  }



abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
  {   
    protected int corners;  //the number of corners, a triangular floater has 3   
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
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
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
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 
public class Star{
  private int sX, sY, wi,he,c;
  public Star(){
    sX=(int)(Math.random()*500);
    sY=(int)(Math.random()*500);
    wi=(int)(Math.random()*5);
    he=(int)(Math.random()*5);
    c= (int)(Math.random()*255);
  }

  public void show()
  {
    noStroke();
    fill(c,(int)(Math.random()*255),c);
    ellipse(sX, sY, wi,he);
  }


}
