class Battery extends Component{
  Battery(){
    vert=true;
    img=loadImage("Battery.png");
    X=CX-(img.width/2);
    Y=CY-(img.height/2);
    setConnectionPoints();
    circuitParts.add(this);
  }
}
