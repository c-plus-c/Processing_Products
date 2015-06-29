class camerac{
 float x;
 float y;
 float z;
 float radcounter;
 float widly;
 
 camerac(){
   radcounter=150;
   y=960;
   widly=700;
 }
 
 void move(){ 
   y-=960/180;
   if(y<=0) y=0;
   radcounter-=240/165;
   if(radcounter<=-90) radcounter=-90;
   
     widly-=200/120;
   if(widly<=500) widly=500;
   
   x=widly*cos(radcounter*(PI/180));
   z=-widly*sin(radcounter*(PI/180));
 }
 
 void cap(){
   camera(width/2+x,height/2+y,z,width/2,height/2,0,0,1,0);
 }
 
}
