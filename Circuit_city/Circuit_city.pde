PImage menuscreen;
PShape options;

void setup(){
  size(1080, 900);
  background(100,100,100);
  menuscreen = loadImage("electricity-05.jpg");
  s = createShape(RECT, 0, 0, 50, 50);
  
  image(menuscreen, 0, 0, 1080, 900);
}
