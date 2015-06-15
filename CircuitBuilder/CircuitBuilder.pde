
import controlP5.*;
ArrayList<MenuOption> menuItems = new ArrayList<MenuOption>();
ArrayList<Component> circuitParts=new ArrayList<Component>();
ArrayList<Wire> allWires = new ArrayList<Wire>();
ArrayList<circuitTreeNode> batteries = new ArrayList<circuitTreeNode>();
int state;
String message="";
boolean dragon;
Component con=null;
float WireX=0, WireY=0;
int b1x, b1y, bw, bh;
int b2x, b2y;
int b3x, b3y;
ControlP5 cp5;
void setup() {
  frameRate(30);
  size(1080, 900);
  background(100, 100, 100);
  BatteryOption b=new BatteryOption();
  ResistorOption r = new ResistorOption();
  dragon=false;
  state=-1;
  textSize(32);
  b1x=width/2;
  b1y=height/3;
  bw=width/4;
  bh=height/8;
  b2x=b1x;
  b2y=b1y+height/5;
  b3x=b2x;
  b3y=b2y+height/5;
  rectMode(CENTER);
  textAlign(CENTER);
  cp5=new ControlP5(this);
  cp5.addButton("Help")
    .setValue(1)
      .setPosition(0, height*2/9)
        .setSize(100, 50)
          ;
  cp5.addButton("Drag")
    .setValue(2)
      .setPosition(0, height*3/9)
        .setSize(100, 50)
          ;
  cp5.addButton("Connect")
    .setValue(3)
      .setPosition(0, height*4/9)
        .setSize(100, 50)
          ;
  cp5.addButton("Main_Menu")
    .setValue(0)
      .setPosition(0, height/9)
        .setSize(100, 50)
          ;
} 
void draw() {
  if (state==-1) {
    PImage img=loadImage("MenuBackground.png");
    img.resize(width, height);
    background(img);
    fill(0, 40, 255);
    PFont font=loadFont("SakkalMajalla-60.vlw");
    textFont(font);
    text("OHM NOM Presents:\nCircuit Builder", width/2, height/16);
    drawRectangle(b1x, b1y, "New Circuit");
    drawRectangle(b2x, b2y, "Load Circuit");
    drawRectangle(b3x, b3y, "Help");
    cp5.getController("Main_Menu").hide();
    cp5.getController("Help").hide();
    cp5.getController("Drag").hide();
    cp5.getController("Connect").hide();
  } else if (state==-2) {
    tint(255, 126);
    PImage img=loadImage("MenuBackground.png");
    img.resize(width, height);
    background(img);
    noTint();
    fill(255, 10, 10);
    rectMode(CORNER);
    textSize(70);
    text("Help:\nOn the top left corner of the screen,\nyou should see the state of the program.\nIf that state is drag,\nyou can move objects by clicking on them,\nmoving your mouse to where you want the object to go,\nand clicking again. If the state is connect, you can connect the objects with wire by clicking on them. To change the state to drag, press d. To change the state to connect, press c.", 0, 0, width, height);
    rectMode(CENTER);
    textSize(60);
    drawRectangle(b1x, 11*height/12, "Back");
    cp5.getController("Main_Menu").hide();
    cp5.getController("Help").hide();
    cp5.getController("Drag").hide();
    cp5.getController("Connect").hide();
  } else {
    background(200, 200, 200);
    if (state==0)message="Drag";
    if (state==1)message="Connect";
    fill(170, 170, 170);
    rectMode(CORNER);
    rect(width*4/5, height/19, width/6, height*7/8, 10);
    fill(130, 130, 130);
    rect(width*4/5, height/19, width/6, height/9, 10);
    fill(0, 0, 0);
    text("Parts Menu", width*4/5, height/19, width/6, height/8);
    fill(200, 122, 0);
    text("State: "+message,width/2, height/19);
    cp5.getController("Main_Menu").show();
    cp5.getController("Help").show();
    cp5.getController("Drag").show();
    cp5.getController("Connect").show();
    rectMode(CENTER);
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
void drawRectangle(int x, int y, String msg) {
  if (mouseOverRect(x, y, bw, bh)) {
    fill(0, 155, 0, 210);
  } else {
    fill(100, 100, 100, 130);
  }
  rect(x, y, bw, bh);
  //textFont(font,55);
  fill(235, 235, 0);
  text(msg, x, y);
}
void mousePressed() {
  if (state==-1) {
    if (mouseOverRect(b1x, b1y, bw, bh)) {
      ArrayList<Component>parts2=new ArrayList<Component>();
      circuitParts=parts2;
      state = 0;
    } else if (mouseOverRect(b3x, b3y, bw, bh)) {
      state=-2;
    }
  } else if (state==-2) {
    if (mouseOverRect(b1x, 11*height/12, bw, bh)) {
      state=-1;
    }
  } else if (state==0) {
    if (dragon) {
      dragon=false;
      if ((circuitParts.get(circuitParts.size()-1).X+circuitParts.get(circuitParts.size()-1).img.width)>width*5/6 ||
         (circuitParts.get(circuitParts.size()-1).X)<100) {
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
          dragon=true;
        }
      }
    }
  } else if (state==1) {
    for (Component c : circuitParts) {
      c.getClicked();
    }
  }
}
void keyPressed() {
  if (key=='c' && state==0) {
    state=1;
    if (circuitParts.size()>0 && circuitParts.get(circuitParts.size()-1).dragging) {
      circuitParts.remove(circuitParts.size()-1);
    }
    dragon=false;
  }
  if (key=='d' && state==1) {
    state=0;
  }
}
boolean mouseOverRect(int x, int y, int w, int h) {
  return (mouseX >= x-w/2 && mouseX <= x+w/2 && mouseY >= y-h/2 && mouseY <= y+h/2);
}
void Connect(int theValue){
  state=1;
    if (circuitParts.size()>0 && circuitParts.get(circuitParts.size()-1).dragging) {
      circuitParts.remove(circuitParts.size()-1);
    }
    dragon=false;
}
void Help(int theValue){
  state=-2;
}
void Drag(int theValue){
  state=0;
}
void Main_Menu(int theValue){
  state=-1;
}
