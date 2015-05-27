class Battery extends Component{
  Battery(){
    super();
    img=loadImage("Battery.png");
    X=CX-(img.width/2);
    Y=CY-(img.height/2);
    circuitParts.add(this);
  }
}
