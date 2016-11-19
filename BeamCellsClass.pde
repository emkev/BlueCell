
/* 2016.11.20
*/

class BeamCells {
  ArrayList<cell> cells ;
  
  BeamCells() {
    cells = new ArrayList<cell>() ;
  }
  
  void addCell(PVector l , PVector v , float len , float c) {
    cells.add(new cell(l , v , len , c)) ;  
  }
  
  void run() {
    for(int i = cells.size()-1 ; i >= 0 ; i--) {
      cell c = cells.get(i);
      c.update();
      c.checkEdge();
      c.display();
    }
  }

  void merge() {  
    /*
    for(int i = cells.size()-1 ; i >= 0 ; i--) {
      cell c = cells.get(i);
    }

          for(cell cc : cells) {
        if( (c.location != cc.location) 
             &&
            (c.location + c.area/2 == cc.location + cc.area/2) 
           ) 
        {
          cells.remove(cc);
          c.cell_color += 10 ;
          c.area += 5 ;
        }
      }
*/
  }

  
}
