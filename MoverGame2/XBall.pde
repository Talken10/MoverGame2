class XBall 
{ 
 //location& velocity : deal with movement are both vectors (use x,y) 
 PVector location = new PVector (0,0) ; //where is it right now
 PVector velocity = new PVector(0,0); //(x direction and speed, y direction and speed), direction (- or +) speed (#) 
 PVector acceleration1 = new PVector(0,0);
  PVector acceleration2 = new PVector(0,0); 
 float max_speed = random(2,5);  //limits speed
 float max_acc = random(0.1,0.3); //limits acceleration
 boolean exist = true; 
 float dist = 0; //distance from mouse
 
 
 XBall()
 { //puts objects in random areas on screen
  this.location.x = random(width); 
  this.location.y = random(height);
 
 }
 
 void update()//what it does
 {
 
   if (exist) 
    { 
    PVector mouse = new PVector (mouseX, mouseY);
    PVector dir = PVector.sub(mouse, location);
    this.dist = dir.mag(); // distance from the mouse 
    //if(dist < 30) this.live = false;

    dir.normalize(); //use normalizing when interested in vectors direction only
    dir.mult(max_acc); //behavior for chasing the mouse
   
    acceleration1 = dir; //chasing the mouse
    acceleration2 = PVector.random2D(); //crawling
   
    if (dist < 300)
      {
        acceleration1 = acceleration2.lerp(acceleration1,3.0-(dist/300.0)); 
        acceleration1.mult(-1.0); //makes them go the other way
        velocity.add(acceleration1);

      }
    else
    {
    velocity.add(acceleration2);  
   }  


  //velocity.add(dir); follows the mouse
  //velocity.add(acceleration);
 
  velocity.limit(max_speed); //limits the velocity so it can't be bigger than 6
  location.add(velocity); 

  
 }

 }
 
 void display()//what it looks like
 {
   
   if (this.exist)
   {
    //colorMode(HSB, (width+height)/2, 100,100);
    fill( 255,255,255 );
    noStroke();
    circle(location.x, location.y,25);
   }

  
 }
 
void bite() 
{
   
 /*
    PVector mouse = new PVector (x,y);
    PVector dir = PVector.sub(mouse, location);
    this.dist = dir.mag();
 */
 
    if(exist)
    {
    if(this.dist < 30 ) 
      {
       this.exist = false;
        existing = existing - 1; 
      }
    }
}


void check()
{
  //if the x is bigger than the width or 0 then it will return to the 0 or width 
  if (location.x < 0) location.x = width;
  if (location.x > width) location.x = 0;
  
  //if the y is bigger than the height or 0 then it will return to the 0 or height
  if (location.y < 0) location.y = height;
  if (location.y > height) location.y = 0;
}

}
