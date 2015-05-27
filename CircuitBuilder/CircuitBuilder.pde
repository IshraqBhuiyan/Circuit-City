ArrayList<MenuOption> menuItems = new ArrayList<MenuOption>();
ArrayList<Component> circuitParts=new ArrayList<Component>();
int batteryX,batteryY;
void setup(){
  size(800,600);
  background(100,100,100);
  BatteryOption b=new BatteryOption();
} 
void draw(){
  for(MenuOption m:menuItems){
   m.display();
   
  }
  for(Component c:circuitParts){
    c.display();
  }
}
void mousePressed(){
  for(MenuOption m:menuItems){
    if(abs((sq(mouseX)-sq(m.CX))+(sq(mouseY)-sq(m.CY)))<500){
      m.createPart();
    }
  }
}
