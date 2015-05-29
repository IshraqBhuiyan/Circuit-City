class Component{
 float voltage;
 float current;
 float resistance;
 float X,Y,CX,CY;
 float WX1,WY1,WX2,WY2;
 boolean vert;
 PImage img;
 boolean dragging;
 Component(){
   dragging=true;
   CX=mouseX;
   CY=mouseY;
 }
 void getClicked(){
   if(state==0){
     dragging=!dragging;
   }
   else if(state==1){
     
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
   }
   image(img,X,Y);
 }
}
