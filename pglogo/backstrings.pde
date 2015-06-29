class backstrings{
  StringBuffer strg=new StringBuffer("00000000");
  int x;
  int y;
  int z;
  int rotative;
  int yd;
  
  backstrings(){
    x=round(random(0,width));
    y=round(random(-1500,1500));
    z=round(random(550,600));
    yd=round(random(5,10));
    rotative=round(random(0,359));
  }
  
  void setnewrand(){
    for(int i=0;i<8;i++){
      int tmp=round(random(0,1));
      if(tmp==1){
        strg.setCharAt(i,'1');
      }else{
        strg.setCharAt(i,'0');
      }
    }
  }
  
  void drawthis(){
    fill(0,255,0,70);
    for(int i=0;i<8;i++){
      textFont(font);
      pushMatrix();
      translate(width/2,height/2,0);
      translate(z*cos(rotative*(PI/180)),0,z*sin(rotative*(PI/180)));
      text(strg.toString().charAt(i),0,y+i*40,0);
      popMatrix();
    }
    fill(255,255,255);
  }
  
  void upgo(){
    y-=yd;
    if(y<-1500) {
      y=height+25*8;
      rotative=round(random(0,359));
    }
  }
}
