
/* 2016.11.20
*/

class BeamCells {

  ArrayList<cell> cells ;
  //int w_f , h_f ;
  //int[][] fields ;
  
  
  BeamCells(int bc_area) {
    cells = new ArrayList<cell>() ;
    
    /*
    // int[20][10]
    w_f = width  / ( 2 * bc_area ) ;
    h_f = height / ( 2 * bc_area ) ;
    fields = new int[w_f][h_f] ;
    
    for(int i = 0 ; i < w_f ; i++) {
      for(int j = 0 ; j < h_f ; j++) {
        fields[i][j] = 0 ;
      }
    }
    */
  }
  
  void addCell(PVector l , PVector v , float len , float c) {
    cells.add(new cell(l , v , len , c)) ;  
  }
  
  void run() {
    for(int i = cells.size()-1 ; i >= 0 ; i--) {
      
      cell c = cells.get(i);
      
      for(int j = cells.size()-1 ; j >= 0 ; j--) {
        cell oc = cells.get(j);
        float dist = PVector.dist(c.location , oc.location);
        
        if( (dist > 0) && (dist <= (c.area/2 + oc.area/2) )  ) {
          // In here , c.area+= means operates the iniatial object . 
          c.area += oc.area ;
          cells.remove(j);
          // c.area += 8 ;  
          // When a samller one (c) encounts a larger one (oc) ,
          // it makes the larger one disappearment and the smaller one 
          // a little larger . The Logic is wrong .
        }
      }
      
      c.update();
      c.checkEdge();
      c.display();
    }
  }
  
  /*
  // the operating has a logical problem .
  void merge() {  
    //fields[20][10]
    
    for(int i = cells.size()-1 ; i >= 0 ; i--) {
      cell c = cells.get(i);
      int w = (int)(width  / c.location.x) ;
      int h = (int)(height / c.location.y) ;
      
      // If fields[w][h] position exists another cell ,
      // so removes the current cell  , and makes existed cell larger .
       
      if(fields[w][h] > 0) {
        cells.remove(i);
        //cell lc = cells.get(fields[w][h]);
        //lc.area += 8 ;
      }
      else {
        fields[w][h] = i ;
      }
    }

  }
  */
  
}
