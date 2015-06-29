import processing.opengl.*;

long timer=0;

int objnum=300;

backstrings[] strs=new backstrings[objnum];
String sg="Programming";
MainStr strn;
PFont font;
camerac actcamera;

void setup(){
  size(800,600,OPENGL);
  smooth();
  font=loadFont("Times-Roman-40.vlw");
  for(int i=0;i<objnum;i++){
    strs[i]=new backstrings();
  }
  
  strn=new MainStr(sg,"CourierNewPSMT-80.vlw",80,300,0);
  actcamera=new camerac();
  frameRate(60);
}

void draw(){
  
  background(0);
  
  actcamera.move();
  actcamera.cap();
  
  if((timer)%5==0){
    for(int i=0;i<objnum;i++){
      strs[i].setnewrand();
    }
  }
  
  
  
  if(timer>=5){ 
  
    if(timer%12==0){
      strn.inccnt();
    }
  }
  
  if(timer%30==0){
    strn.blinklast();
  }
  strn.disp();
  
  
  for(int i=0;i<objnum;i++){
    strs[i].upgo();
    strs[i].drawthis();
  }

  timer++;
  
  actcamera.move();
  actcamera.cap();
  
  if(timer==270) {
    exit();
  }else{
    saveFrame();
  } 


  
  
  
  
  
}
