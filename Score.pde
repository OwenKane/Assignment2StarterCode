class Score
{
  int savedTime;
  int totalTime;
  int passedTime;

  Score()
  {
      savedTime = second();  
      totalTime = 2; 
  }
  
  void update()
  {
    passedTime = second() - savedTime;
   
    if (passedTime > totalTime)//Addes 1 to point every 2 seconds
    {
      points = points + 1;
      savedTime = second(); // Save the current time to restart the timer
    }   
  }
}
  
