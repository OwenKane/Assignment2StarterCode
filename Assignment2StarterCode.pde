ArrayList<Player> players = new ArrayList<Player>();
boolean[] keys = new boolean[526];

Ship ship;
StartS startS;
Tip tip;
Harpoon harpoon;
End end;
Score score;
Instruct instruct;

boolean left;
boolean right;
float i = 180;
float w = 300;
float barrely = -40;
float barrelx = -100;
float h = 40;
boolean tipping;
float temp = 0;
float disttempy = 0;
float disttempx = 0;
PImage sea;
PImage sky;
int points;
boolean move;
int option;


void setup()
{
  size(800, 600);
  setUpPlayerControllers();
  
  ship = new Ship();
  startS = new StartS();
  tip = new Tip();
  harpoon = new Harpoon();
  end = new End();
  score = new Score();
  instruct = new Instruct();
  
  sea = loadImage("sea1.png");
  sky = loadImage("sky2.png");
  points = 0;
  option = 0;
  
}

void draw()
{
  if(startS.go == false)
  {
    frameRate(10);
    startS.display();    
    for(Player player:players)
    {
      player.update();
    }

    if(option < 0)
    {
      option = 0;
    }
    else if(option > 2)
    {
      option = 2;
    }
    
  }
  else if(end. go == true)
  {
    end.display();
  }
  else if(option == 1)
  {
    instruct.go = true;
    instruct.display();
  }
  else if(option == 0 || option == 2)
  {  
    frameRate(60);
    background(255);
    image(sky, 0, 0);
    fill(0);
    textSize(32);
    text("Score: " + points, 10, 30);
    
    pushMatrix();
    translate(width/2, height/2);
    rotate(radians(i));  
    fill(255);
    
    ship.display();
    tip.update();
    
    rectMode(CORNER); 
    for(Player player:players)
    {
      player.update();
      player.display();
      player.pos.y = 20;   
    }
    
    if(left == true)
    {
      harpoon.hx = harpoon.hx + 2;
      image(harpoon.harpoonR, harpoon.hx, harpoon.hy);
    }
    
    if(right == true)
    {
      harpoon.hx = harpoon.hx - 2;
      image(harpoon.harpoonL, harpoon.hx, harpoon.hy);
    }
 
    translate(width/2, height/2);
    popMatrix();
    image(sea, 0, 345);
    harpoon.disappear();
    score.update();
  }
}


void mouseClicked()
{
  instruct.mouseClicked();
  end.mouseClicked();
}

void keyPressed()
{
  keys[keyCode] = true;
}

void keyReleased()
{
  keys[keyCode] = false;
}

boolean checkKey(char theKey)
{
  return keys[Character.toUpperCase(theKey)];
}

char buttonNameToKey(XML xml, String buttonName)
{
  String value =  xml.getChild(buttonName).getContent();
  if ("LEFT".equalsIgnoreCase(value))
  {
    return LEFT;
  }
  if ("RIGHT".equalsIgnoreCase(value))
  {
    return RIGHT;
  }
  if ("UP".equalsIgnoreCase(value))
  {
    return UP;
  }
  if ("DOWN".equalsIgnoreCase(value))
  {
    return DOWN;
  }
  //.. Others to follow
  return value.charAt(0);  
}

void setUpPlayerControllers()
{
  XML xml = loadXML("arcade.xml");
  XML[] children = xml.getChildren("player");
  int gap = width / (children.length + 1);
  
  for(int i = 0 ; i < children.length ; i ++)  
  {
    XML playerXML = children[i];
    Player p = new Player(
            i
            , color(random(0, 255), random(0, 255), random(0, 255))
            , playerXML);
    int x = (i + 1) * gap;
    p.pos.x = 0;
    p.pos.y = 20;
   players.add(p);       
  }
}
