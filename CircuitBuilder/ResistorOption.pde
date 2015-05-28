class ResistorOption extends MenuOption {
  ResistorOption() {
    X=width*4/5;
    Y=height/3;
    img=loadImage("Resistor.png");
    CX=X+(img.width/2);
    CY=Y+(img.height/2);
    menuItems.add(this);
  }
  void getClicked() {
    Resistor a = new Resistor();
  }
  void display() {
    image(img, X, Y);
  }
}

