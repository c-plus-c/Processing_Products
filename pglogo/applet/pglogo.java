import processing.core.*; 
import processing.xml.*; 

import processing.opengl.*; 

import java.applet.*; 
import java.awt.*; 
import java.awt.image.*; 
import java.awt.event.*; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 

public class pglogo extends PApplet {



long timer=0;

int objnum=100;

backstrings[] strs=new backstrings[objnum];
String sg="Programming";
MainStr strn;
PFont font;

public void setup(){
  size(800,600,OPENGL);
  smooth();
  font=loadFont("Times-Roman-20.vlw");
  for(int i=0;i<objnum;i++){
    strs[i]=new backstrings();
  }
  strn=new MainStr(sg,"CourierNewPSMT-80.vlw",80,300,0);
  
  frameRate(60);
}

public void draw(){
  
  background(0);
  /*
  camera(400,300,500,width/2,height/2,0,0,1,0);
  */
  camera(400,1000,100,width/2,height/2,0,0,1,0);
  
  if((timer)%5==0){
    for(int i=0;i<objnum;i++){
      strs[i].setnewrand();
    }
  }
  
  if(timer>=30){ 
  
    if(timer%10==0){
      strn.inccnt();
    }
  
    if(timer%30==0){
      strn.blinklast();
    }
  
    strn.disp();
  }
  
  
  for(int i=0;i<objnum;i++){
    strs[i].upgo();
    strs[i].drawthis();
  }

  timer++;
  
  
}
class MainStr{
  String mainstr;
  String dispstr="";
  int strdisp;
  int x;
  int y;
  int z;
  PFont fontr;
  boolean displast;
  
  MainStr(String s,String fonts,int xs,int ys,int zs){
    mainstr=new String(s);
    displast=true;
    fontr=loadFont(fonts);
    x=xs;
    y=ys;
    z=zs;
    strdisp=0;
  }
  
  public void inccnt(){
    if(++strdisp>mainstr.length()) strdisp=mainstr.length();
    dispstr=mainstr.substring(0,strdisp);
    if(strdisp==mainstr.length()){  
      if(displast){
        dispstr=dispstr+'|';
      }else{
        dispstr=dispstr+' ';
      }
    }
  }
  
  public void blinklast(){
    displast=!displast;
  }
  
  public void disp(){
    textFont(fontr);
    if(strdisp!=mainstr.length()){
      text(dispstr+'|',x,y,z);
    }else{
      text(dispstr,x,y,z);
    }
  }
    
}
class backstrings{
  StringBuffer strg=new StringBuffer("00000000");
  int x;
  int y;
  int z;
  int rotative;
  int yd;
  
  backstrings(){
    x=(int)random(0,width);
    y=(int)random(-700,700);
    z=(int)random(400,470);
    yd=round(random(1,3));
    rotative=round(random(0,359));
  }
  
  public void setnewrand(){
    for(int i=0;i<8;i++){
      int tmp=round(random(0,1));
      if(tmp==1){
        strg.setCharAt(i,'1');
      }else{
        strg.setCharAt(i,'0');
      }
    }
  }
  
  public void drawthis(){
    fill(255,255,255,40);
    for(int i=0;i<8;i++){
      textFont(font);
      pushMatrix();
      translate(width/2,height/2,0);
      translate(z*cos(rotative*(PI/180)),0,z*sin(rotative*(PI/180)));
      rotateY(rotative*(PI/180));
      text(strg.toString().charAt(i),0,y+i*25,0);
      popMatrix();
    }
    fill(255,255,255);
  }
  
  public void upgo(){
    y-=yd;
    if(y<-400) {
      y=height+25*8;
      rotative=round(random(0,359));
    }
  }
}

  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#FFFFFF", "pglogo" });
  }
}
