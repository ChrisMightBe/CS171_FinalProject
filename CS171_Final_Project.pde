import ddf.minim.*;

Minim minim = new Minim(this);  //code for minim usage found in joe timoneys slides on moodle
AudioPlayer music;



int Score = 0;

int player_x = 380;
int player_y = 400;

boolean loseGame = false;
boolean Active = false;

/*to change difficulty, the numbers within the random parameters can be changed to 
  increase or decrease resets per game*/
int bin =int( random(1));
int electricity =int( random(5));
int water = int(random(3));

int timer = 0;

void setup()  // setup of the application window
{
  size(800, 500);
  
}

void draw()  //function to call upon gameplay functions
{
  if(Score == 0)
  {
    menu();
  }
  if(Score > 0)
  {
    game();
  }
}

void menu()  // function for the main menu system
{
  timer = 0;
  player_x = 380;
  player_y = 400;
  background(51, 51, 0);
  
  //music = minim.loadFile("menu.wav");
 // music.loop();  trying to run returned a loading error
  
  fill(255);  //menu text creation
  textSize(55);
  text("Start Game", 275, 300);
  textSize(35);
  text("Quit", 365, 400);
  
  //instruction text
  textSize(20);
  text("Press e to interact", 0, 20);
  text("Return to yellow square to refresh interaction", 0, 40);
  text("WASD to move", 0, 60);
  text("Red light means item needs fixing", 0, 80);
  text("Interact with a green light an it is game over", 0, 100);
  text("The timer default is 30 seconds", 0, 120);
  
  
  
  if(mouseX>365 && mouseY>365)  //functionality of quit button
  {
    if(mouseX<435 && mouseY<400)
    {
      fill(204, 0, 0);
      textSize(35);  //change colour of button when hovered over
      text("Quit", 365, 400);
      if(mousePressed==true)
      {
        exit();
      }
    }
  }
   if(mouseX>275 && mouseY>255)  //functionality of Start Game button
  {
    if(mouseX<530 && mouseY<305)
    {
      fill(255, 230, 102);  // Change colour when hovered over
      textSize(55);
      text("Start Game", 275, 300);
      if(mousePressed==true)
      {
        Score = 1;
      }
    }
  }
  
    
}

void game()  //function for the game
{
  //music = minim.loadFile("game.");
  //music.loop()
  
  background(153, 230, 0);
  
  
  timer = millis();
  textSize(20);
  fill(0);
  text("Time:" + timer/1000, 20, 470);
  
  fill(255, 255, 0);
  square(380, 280, 40);
  player(); //inputting the palyer into the main game
  if(player_x>340 && player_y>240)  //functionality of quit button
  {
    if(player_x<420 && player_y<320)
    {
      
      Active = false;
    }
  }
  
  
  fill(255, 255, 204);
  rect(70, 0, 660, 120); //house
  
  
  if(bin>0) //bin
  {
    fill(255, 0, 0);
  }
  else
  {
    fill(0, 255, 0);
  }
  circle(640, 100, 30);  //light green if bin needs attention
  fill(51, 34, 0);
  square(620, 120, 40);
  if(player_y < 170)  //bin check
  {
    if(player_x>580 && player_x<660)
    {
      if(keyPressed==true && key == 'e' && Active == false)
      {
        if(bin>0)
        {
          Score = Score + 100;
          bin = bin - 1;
          Active = true;
      }
      else
      {
        loseGame = true;
      }
    }
  }
  }
 
  if(electricity>0) //electricity
  {
    fill(255, 0, 0);
  }
  else
  {
    fill(0, 255, 0);
  }
  circle(330, 100, 30);
  fill(138, 138, 138);
 square(310, 120, 40);
 if(player_y < 170)  //electricity check
  {
    if(player_x>270 && player_x<350)
    {
      if(keyPressed==true && key == 'e' && Active == false)
      {
        if(electricity>0)
        {
          Score = Score + 100;
          electricity= electricity - 1;
          Active = true;
      }
      else
      {
        loseGame = true;
      }
    }
  }
  }
 
  if(water>0) //water
  {
    fill(255, 0, 0);
  }
  else
  {
    fill(0, 255, 0);
  }
  circle(100, 100, 30);
  fill(102, 153, 255);
  square(80, 120, 40);
  if(player_y < 170)  //water check
  {
    if(player_x>40 && player_x<120)
    {
      if(keyPressed==true && key == 'e' && Active == false )
      {
        if(water>0)
        {
          Score = Score + 100;
          water = water - 1;
          Active = true;
      }
      else
      {
        loseGame = true;
      }
    }
  }
  }
  
  
  if(bin == 0 && electricity == 0 && water == 0) //reset variables to continue game
  {
   Score = Score + 300;
   bin = int(random(1));
   electricity = int(random(5));
   water = int(random(3));
  }
  
  // to change difficulty, timer amount can be increased or decreased
  if(timer > 30000 || loseGame == true)  //endgame condition
  {
    
    background(51, 51, 0);
 
    fill(255);
    textSize(55);
    text("Game Over", 275, 300);
    textSize(40);
    text("Score: " + (Score-1), 275, 400);
    textSize(20);
    text("Click n key to close game", 250, 500);
  
    if(keyPressed == true)
    {  
      if( key == 'n' || key == 'N')
      {
      exit();
      }
    }
  }
}





void player()  // function for player interaction
{
  if(keyPressed) // movement
  {
    if(key == 'a' || key == 'A') //left
    {
       if(player_x > 0)
      {
         player_x = player_x - 3;
      }
    }
    if(key == 'd' || key == 'D') //right
    {
       if(player_x < 760)
      {
         player_x = player_x + 3;
      }
    }
    if(key == 'w' || key == 'W') //up
    {
       if(player_y > 162)
      {
         player_y = player_y - 3;
      }
    }
    if(key == 's' || key == 'S') //down
    {
       if(player_y < 480)
      {
         player_y = player_y + 3;
      }
    }
  }
  fill(0, 0, 204);
  rect(player_x, player_y, 40, 40);
}




void endGame()  //code for a game over screen
{
  background(51, 51, 0);
 
 Score = Score-1;
  fill(255);
  textSize(55);
  text("Game Over", 275, 300);
  textSize(40);
  text("Score: " + Score, 275, 400);
  
  delay(10000);
  exit();
}
