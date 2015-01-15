class Ship
{
  PImage ship;
  
  Ship()
  {
    ship = loadImage("ship2.1.png");    
  }
  
  void display()
  { 
    pushMatrix();
    scale(-1.0, -1.0);
    image(ship, -250, -140);
    ship.resize(475, 200);
    popMatrix();
  }
  
}

