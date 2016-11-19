
/* 2016.11.17 
   2016.11.20
*/
cell mc ;
BeamCells beam_cells ;
int mc_area ;
int bc_area ;

void setup()
{
  size(640 , 320);
  mc_area = 32 ;
  bc_area = 16 ;
  
  mc = new cell(new PVector(width / 2 , height / 2) ,
                new PVector(0.75 , 0.75) , 
                mc_area , 150) ;
  beam_cells = new BeamCells(bc_area) ;
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

  PVector bc_loc_tmp = PVector.mult(bc_vel , mc_area/2);
  PVector bc_loc = PVector.add(mc.location , bc_loc_tmp);
  
  beam_cells.addCell(bc_loc , bc_vel , bc_area , 50) ;
}
