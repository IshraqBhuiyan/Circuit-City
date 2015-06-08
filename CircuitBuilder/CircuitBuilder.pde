ArrayList<MenuOption> menuItems = new ArrayList<MenuOption>();
ArrayList<Component> circuitParts=new ArrayList<Component>();
ArrayList<Wire> allWires = new ArrayList<Wire>();
int state;
String message="";
boolean dragon;
Component con=null;
float WireX=0, WireY=0;
void setup() {
  frameRate(30);
  size(1080, 900);
  background(100, 100, 100);
  BatteryOption b=new BatteryOption();
  ResistorOption r = new ResistorOption();
  dragon=false;
  state=-1;
  textSize(32);
} 
void draw() {
  if (state==-1) {
    PImage img=loadImage("MenuBackground.png");
    img.resize(width,height);
    background(img);
    fill(0,40,255);
    PFont font=loadFont("SakkalMajalla-60.vlw");
    textFont(font);
    textAlign(CENTER);
    text("OHM NOM Presents:\nCircuit Builder",width/2,height/16);
    int b1x=width/2;
    int b1y=height/3;
    int b1w=width/4;
    int b1h=height/8;
    if(mouseOverRect(b1x,b1y,b1w,b1h)){
      fill(0,155,0);
    } else {
      fill(155,155,155);
    }
    rectMode(CENTER);
    rect(b1x,b1y,b1w,b1h);
    textFont(font,55);
    fill(235,235,0);
    text("New Circuit",b1x,b1y);
  } else {
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
    for (Wire w : allWires) {
      w.display();
    }
    if (state==1 && con!=null) {
      line(mouseX, mouseY, WireX, WireY);
    }
  }
}
void mousePressed() {
  if(state==-1){
    if(mouseX > width/2 && mouseX < width/2 + width/4 && mouseY > height/3 && mouseY < height/3 + height/8){
      state = 0;
    }
  }else if (state==0) {
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
  } else if (state==1) {
    for (Component c : circuitParts) {
      c.getClicked();
    }
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
boolean mouseOverRect(int x, int y, int w, int h) {
  return (mouseX >= x-w/2 && mouseX <= x+w/2 && mouseY >= y-h/2 && mouseY <= y+h/2);
}
