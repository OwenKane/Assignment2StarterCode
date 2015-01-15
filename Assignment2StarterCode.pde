ArrayList<Player> players = new ArrayList<Player>();
boolean[] keys = new boolean[526];

Ship ship;
float i = 180;
float w = 300;
float h = 40;
boolean tip;
float temp = 0;
PImage sea;

void setup()
{
  size(800, 600);
  setUpPlayerControllers();
  ship = new Ship();
  sea = loadImage("sea1.png"); 
}

void draw()
{
  background(255);

  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(i));  
  fill(255);
  
  ship.display();
  
  rectMode(CENTER);
  //fill(0);
  //rect(0, 0, w, h);//ship "skeleton"
  //fill(0, 255, 0);
  //rect(0, 10, 10, h);
  
  
  rectMode(CORNER); 
  for(Player player:players)
  {
    player.update();
    player.display();
    player.pos.y = 20;
    
    if(player.pos.x < 0)
    {
      temp = -1 * (player.pos.x / 250);
      println("temp is" + temp);
      i = (i + .1) + temp;
      println("x is < 0" + player.pos.x);
    }
    
    if(player.pos.x > 0)
    {
      temp =(player.pos.x / 250);
      i = (i - .1) - temp;
      println("x is > 0" + player.pos.x);
    }
      
  }
  popMatrix();
  image(sea, 0, 345);
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
