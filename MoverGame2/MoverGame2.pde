int nMover = 50; 
int nXBall = 100;
Mover[] m = new Mover[nMover]; 
XBall [] b = new XBall [nXBall];
boolean clicked = false;
color col = color(0,0,0);
int hue = 500;
int hue2 = 500;
int bri = 25;
int sat = 25;
int living = nMover;
int existing = nXBall;
PGraphics screen;

void setup()
{
size(800,800); 
surface.setTitle ("muchy munchy");




//fullScreen();

screen = createGraphics(width,height); 

 for (int i = 0; i < m.length; i = i + 1) //loop that will repeat 10 times
 {
   m[i] = new Mover(); //creates movers
   b [i] = new XBall();
 }


 }



void drawMe()
{

  noStroke();
  fill(color(0,0,255));
  circle(mouseX,mouseY,30);

}


void draw()
{
  fill(0,0,0,50);
  rect(0,0, width, height); 
  


noStroke();
colorMode(HSB, (width+height) ,50,100);
fill(50, 10, 100);
rect(0,0, width, height);

 for (int i = 0; i < m.length; i = i + 1) 
 {
   m[i].update(); //updates the position
   m[i].check(); //activates check
   m[i].display(); //displays the object on the screen
   
   b[i].update(); //updates the position
   b[i].check(); //activates check
   b[i].display(); //displays the object on the screen
 }


 //drawMe();

  hud();
 
 
  
}



void mousePressed()
{
 
  for (int i = 0; i < m.length; i = i + 1) //send mouse cordinates to the circles in a cycle
   {
    m[i].bite(); 
    b [i].bite();
  } 
 
  
}


void hud()//health bar
{
translate(width/2,10); //rect around health bar and number
 colorMode(HSB, (width+height) , 100,100);
 fill(200,25,100);
 noStroke();
 rect(-50,-50,101,90,800);

 fill(200,25,50); 
 textAlign(CENTER);
 textSize(50);
 text(living,0,50);
 
 fill(200,25,50); 
 textAlign(CENTER);
 textSize(25);
 text(hue,0,78);
 
 /*fill(200,25,50); 
 textAlign(CENTER);
 textSize(25);
 text(hue2,0,90);*/
 
 translate(-nMover/2,0);
 
 noStroke(); //health bar
 fill(hue,75,75);
 rect(-25,0,(living*2),10,15);
 
 noFill();//health bar outline
 strokeWeight(2);
 stroke(color(255));
 rect(-25,0,(nMover * 2),10,15);
 

}
