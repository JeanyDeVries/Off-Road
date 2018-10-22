<<<<<<< HEAD
import controlP5.*;
PImage startscreen;
PFont title;
PImage selected;
ControlP5 cp5;
int ypos = 275;
PImage button1;
PImage button2;
PImage button3;
PImage menu_control;
PImage j4;
boolean showImage = true;
boolean showControl = false;
void setup (){
  size(1280,720);
  title = createFont("font",1000,true);
  startscreen = loadImage("menu_main.png");
  image(startscreen, 0,0, 1280, 720);
  button1 = loadImage("menu_button.png");
  button2 = loadImage("menu_button.png");
  button3 = loadImage("menu_button.png");
  menu_control = loadImage("menu_controlUI.png");
  selected = loadImage("menu_buttonSelected.png");
  

}

void draw(){
  image(startscreen, 0,0, 1280, 720);
  textAlign(CENTER);
  if(showImage){
  image(button1, 175, 275, 231, 89);
  image(button2, 175, 375, 231, 89);
  image(button3, 175, 475, 231, 89);
  textSize(20);
  fill(0);
  text("Play",290,315);
  text("Controls",290,420);
  text("Exit",290,520);
  image(selected, 175, ypos, 233, 91);
}
if(showControl){
 image(menu_control, 400, 180, 480, 360);
}
}


void keyPressed(){
  if(!showControl){
  if(ypos != 275){
  if( keyCode == UP )  {
    ypos = ypos- 100;
  }
}
if(ypos != 475)
if( keyCode == DOWN )  {
    ypos = ypos+ 100;
}
  }
if(ypos == 275 && key == 'a'){
 startscreen = loadImage("j4.PNG"); 
 showImage = false;
}
if(ypos == 375 && key == 'a'){
 loadImage("menu_controlUI.png");
 showControl = true;
}
if(ypos == 475 && key == 'a'){
 exit(); 
}
if(showControl && key == 'b'){
  showControl = false;
  
}
}
=======
import controlP5.*;
PImage startscreen;
PFont title;
PImage selected;
ControlP5 cp5;
int ypos = 275;
PImage button1;
PImage button2;
PImage button3;
PImage menu_control;
PImage j4;
boolean showImage = true;
boolean showControl = false;
void setup (){
  size(1280,720);
  title = createFont("font",1000,true);
  startscreen = loadImage("menu_main.png");
  image(startscreen, 0,0, 1280, 720);
  button1 = loadImage("menu_button.png");
  button2 = loadImage("menu_button.png");
  button3 = loadImage("menu_button.png");
  menu_control = loadImage("menu_controlUI.png");
  selected = loadImage("menu_buttonSelected.png");
  

}

void draw(){
  image(startscreen, 0,0, 1280, 720);
  textAlign(CENTER);
  if(showImage){
  image(button1, 175, 275, 231, 89);
  image(button2, 175, 375, 231, 89);
  image(button3, 175, 475, 231, 89);
  textSize(20);
  fill(0);
  text("Play",290,315);
  text("Controls",290,420);
  text("Exit",290,520);
  image(selected, 175, ypos, 233, 91);
}
if(showControl){
 image(menu_control, 400, 180, 480, 360);
}
}


void keyPressed(){
  if(!showControl){
  if(ypos != 275){
  if( keyCode == UP )  {
    ypos = ypos- 100;
  }
}
if(ypos != 475)
if( keyCode == DOWN )  {
    ypos = ypos+ 100;
}
  }
if(ypos == 275 && key == 'a'){
 startscreen = loadImage("j4.PNG"); 
 showImage = false;
}
if(ypos == 375 && key == 'a'){
 loadImage("menu_controlUI.png");
 showControl = true;
}
if(ypos == 475 && key == 'a'){
 exit(); 
}
if(showControl && key == 'b'){
  showControl = false;
  
}
}
>>>>>>> 1bd8cbe780432a3705a249408bb474b1c62db9d2
