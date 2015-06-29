class MainStr{
  String mainstr;
  String dispstr;
  int strdisp;
  int x;
  int y;
  int z;
  PFont fontr;
  boolean displast;
  
  MainStr(String s,String fonts,int xs,int ys,int zs){
    mainstr=new String(s);
    dispstr=new String("");
    displast=true;
    fontr=loadFont(fonts);
    x=xs;
    y=ys;
    z=zs;
    strdisp=0;
  }
  
  void inccnt(){
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
  
  void blinklast(){
    displast=!displast;
  }
  
  void disp(){
    textFont(fontr);
    if(strdisp!=mainstr.length()){
      text(dispstr+'|',x,y,z);
    }else{
      text(dispstr,x,y,z);
    }
  }
    
}
