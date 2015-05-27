class MenuOption {
  float X, Y,CX,CY;
  boolean clicked;
  PImage img;
  MenuOption(){
    clicked=false;
  }
  void display(){}
  void getClicked(){
    clicked=!clicked;
  }
}

