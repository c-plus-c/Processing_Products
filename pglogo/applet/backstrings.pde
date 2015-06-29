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
  
  void upgo(){
    y-=yd;
    if(y<-400) {
      y=height+25*8;
      rotative=round(random(0,359));
    }
  }
}
