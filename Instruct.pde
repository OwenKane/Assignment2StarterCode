class Instruct extends StartS
{  
  Instruct()
  {
    screen = loadImage("ins.png");    
    go = false;
  }
  
  void display()
  { 
    if( go == true)
    {
      println("here");
      image(screen, 0, 0);
    }
    else
    {
      println("oops1");
      //startS.go = false;
      //startS.display();
      go = false; 
      option = 0;
    }
  }
    
}
