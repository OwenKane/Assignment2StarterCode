class Instructions extends StartS
{
   void Instructions()
   {
     screen = loadImage("instructions.png"); 
   } 
   
  void display()
  { 
    if(go == true)
    {
      image(screen, 0, 0);
    }
    else
    {
      startS.display(); 
    }
  }
  
}
