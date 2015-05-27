class Component{
 float voltage;
 float current;
 float resistance;
 float X,Y,CX,CY;
 PImage img;
 boolean dragging;
 Component(){
   dragging=true;
   CX=mouseX;
   CY=mouseY;
 }
 void display(){
   if(dragging){
     CX=mouseX;
     CY=mouseY;
     X=CX-(img.width/2);
     Y=CY-(img.height/2);
   }
   image(img,X,Y);
 }
}
