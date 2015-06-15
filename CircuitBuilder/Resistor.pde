class Resistor extends Component{
  Resistor(){
    vert=false;
    img=loadImage("Resistor.png");
    X=CX-(img.width/2);
    Y=CY-(img.height/2);
    setConnectionPoints();
    circuitParts.add(this);
  }
  
  void connectedAction(){
    tint(255, 50, 50);
  }
}
