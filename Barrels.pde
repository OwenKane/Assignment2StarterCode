class Barrels
{
   Barrels()
  {
    
  }
  
  void display()
  { 
     if( disttempy < 40 && disttempy > -1 && disttempx < 0 && disttempx > -40 )
     {
       println("HIT");
       barrely = -300;
     }
      
     println(disttempx);
  }
  
}
