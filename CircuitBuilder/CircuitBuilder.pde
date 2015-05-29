ArrayList<MenuOption> menuItems = new ArrayList<MenuOption>();
ArrayList<Component> circuitParts=new ArrayList<Component>();
int state;
String message="";
boolean dragon;
void setup() {
  frameRate(30);
  size(1080, 900);
  background(100, 100, 100);
  BatteryOption b=new BatteryOption();
  ResistorOption r = new ResistorOption();
  dragon=false;
  state=0;
  textSize(32);
} 
void draw() {
  background(100, 100, 100);
  if (state==0)message="Drag";
  if (state==1)message="Connect";
  fill(200, 122, 0);
  text("State: "+message, 10, 30);

  for (MenuOption m : menuItems) {
    m.display();
  }
  for (Component c : circuitParts) {
    c.display();
  }
}
void mousePressed() {
  if (state==0) {
    if (dragon) {
      if ((circuitParts.get(circuitParts.size()-1).X+circuitParts.get(circuitParts.size()-1).img.width)>width*5/6) {
        circuitParts.remove(circuitParts.size()-1);
      }
      for (Component c : circuitParts) {
        c.dragging=false;
      }
    } else {
      for (MenuOption m : menuItems) {
        if (abs(mouseX-m.CX)<=m.img.width/2 && 
          abs(mouseY-m.CY)<=m.img.height/2) {
          m.getClicked();
        }
      }
    }
    dragon=!dragon;
  }
}
void keyPressed() {
  if (key=='c') {
    state=1;
    if (circuitParts.get(circuitParts.size()-1).dragging) {
      circuitParts.remove(circuitParts.size()-1);
    }
  }
  if (key=='d') {
    state=0;
  }
}

