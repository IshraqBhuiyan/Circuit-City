class Wire{
  float startX,startY,endX,endY;
  Wire(Component c){
    startX=WireX;
    startY=WireY;
    if((c.vert && mouseY<c.CY) || (!c.vert && mouseX<c.CX)){
      endX=c.WX1;
      endY=c.WY1;
      allWires.add(this);
    }
    else{
      endX=c.WX2;
      endY=c.WY2;
    }
  }
  void display(){
    line(startX,startY,endX,endY);
  }
}
