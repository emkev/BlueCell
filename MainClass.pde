
/* 2016.11.17 
   2016.11.20
*/
cell mc ;
BeamCells beam_cells ;

void setup()
{
  size(640 , 360);
  mc = new cell(new PVector(width / 2 , height / 2) ,
                new PVector(0.75 , 0.75) , 
                32 , 150) ;
  beam_cells = new BeamCells() ;
}

void draw()
{
  background(200);
  
  mc.update();
  mc.checkEdge();
  mc.display();

  beam_cells.run();  
}

void mousePressed() {
  
  PVector mouse = new PVector(mouseX , mouseY) ;
  PVector bc_vel = PVector.sub(mouse , mc.location);
  bc_vel.normalize();

  PVector bc_loc_tmp = PVector.mult(bc_vel , 16);
  PVector bc_loc = PVector.add(mc.location , bc_loc_tmp);
  
  beam_cells.addCell(bc_loc , bc_vel , 16 , 50) ;
}
