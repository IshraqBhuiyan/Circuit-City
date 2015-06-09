class Component{
 float voltage;
 float current;
 float resistance;
 float X,Y,CX,CY;
 float WX1,WY1,WX2,WY2;
 int ID;
 boolean vert;
 PImage img;
 boolean dragging;
 Component(){
   dragging=true;
   CX=mouseX;
   CY=mouseY;
   ID=circuitParts.size()+1;
 }
 void getClicked(){
   if(mouseX > (X+img.width) || mouseX < X || mouseY > (Y+img.height) || mouseY < Y){
     return;
   }
   if(state==0){
     dragging=!dragging;
   }
   else if(state==1){
     if(con==null){
       con=this;
       if((vert && (mouseY < CY)) || (!vert && (mouseX < CX))){
         WireX=WX1;
         WireY=WY1;
       }
       else{
         WireX=WX2;
         WireY=WY2;
       }
     }
     else{
       if(con.ID!=ID){
         Wire w=new Wire(this);
       }
       con=null;
       WireX=0;
       WireY=0;
     }
   }
 }
 void setConnectionPoints(){
   if(vert){
     WX1=CX;
     WX2=CX;
     WY1=Y;
     WY2=Y+img.height;
   }
   else{
     WX1=X;
     WX2=X+img.width;
     WY1=CY;
     WY2=CY;
   }
 }
 void display(){
   if(dragging){
     CX=mouseX;
     CY=mouseY;
     X=CX-(img.width/2);
     Y=CY-(img.height/2);
     setConnectionPoints();
   }
   image(img,X,Y);
 }
}
