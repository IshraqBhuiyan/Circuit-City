class Lightbulb extends Component{
  Lightbulb(){
    vert = true;
    img=loadImage("lightbulb.png");
    X=CX-(img.width/2);
    Y=CY-(img.height/2);
    //setConnectionPoints();
    circuitParts.add(this);
  }
}
