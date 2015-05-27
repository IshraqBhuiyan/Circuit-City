class BatteryOption extends MenuOption{
  BatteryOption(){
    X=width*5/6;
    Y=height/6;
    img=loadImage("Battery.png");
    CX=X+(img.width/2);
    CY=Y+(img.height/2);
    menuItems.add(this);
  }
  void createPart(){
    Battery a = new Battery();
  }
  void display(){
    if(clickedOn){
      createPart();
    }
    image(img,X,Y);
  }
}
