
/* 2016.11.17 ,
  On Yesterday Evening , In Xidan Apple Store ,
  Blue cells game on 27 inch iMac with Retina made me so so so excited .
  2016.11.20 am 00:21
*/

class cell
{
  PVector location ;
  PVector velocity ;
  PVector acceleration ;
  
  float maxSpeed ;
  float area ;
  float cell_color ; 
  
  cell(PVector l , PVector v , float len , float c) 
  {
    location = l.get();
    velocity = v.get();
    acceleration = new PVector(0 , 0) ;
    
    maxSpeed = 10 ;
    area = len ;
    cell_color = c ;
  }
  
  void applyForce(PVector f)
  {
    acceleration.add(f);
  }
  
  void update()
  {
    velocity.add(acceleration);
    velocity.limit(maxSpeed);
    location.add(velocity);
    
    acceleration.mult(0);
  }
  
  void checkEdge()
  {
    if( ((location.x-area/2) < 0) || ((location.x+area/2) > width) )
      velocity.x = (-1) * velocity.x ;
     
    if( ((location.y-area/2) < 0) || ((location.y+area/2) > height) )
      velocity.y = (-1) * velocity.y ; 
  }
  
  void display()
  {
    fill(cell_color);
    ellipse(location.x , location.y , area , area) ;
  }
  
}
