class Resistor extends Component{
  Resistor(){
    img=loadImage("Resistor.png");
    X=CX-(img.width/2);
    Y=CY-(img.height/2);
    circuitParts.add(this);
  }
}
