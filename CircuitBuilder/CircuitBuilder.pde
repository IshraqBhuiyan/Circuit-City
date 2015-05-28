ArrayList<MenuOption> menuItems = new ArrayList<MenuOption>();
ArrayList<Component> circuitParts=new ArrayList<Component>();
int batteryX,batteryY;
boolean dragon;
void setup(){
  frameRate(30);
  size(1080,900);
  background(100,100,100);
  BatteryOption b=new BatteryOption();
  dragon=false;
} 
void draw(){
  background(100,100,100);
  for(MenuOption m:menuItems){
   m.display();
   
  }
  for(Component c:circuitParts){
    c.display();
  }
}
void mousePressed(){
  if(dragon){
    for(Component c:circuitParts){
      c.dragging=false;
    }
  }
  else{
    for(MenuOption m:menuItems){
      if(abs(mouseX-m.CX)<=m.img.width/2 && 
      abs(mouseY-m.CY)<=m.img.height/2){
        m.getClicked();
      }
    }
  }
  dragon=!dragon;
}
