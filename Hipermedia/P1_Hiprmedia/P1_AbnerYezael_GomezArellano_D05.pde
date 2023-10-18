void setup(){
 size(600,400);
 background(210);
}

void draw(){
  
 int x=width;
 int y= height;
 int v=1; 
 
 for(int rep=0; rep<90; rep++){
   
  stroke(random(255),random(255),random(255));
  for(;y> v* 10;y--){
   point (x-10,y);
  }
   stroke(random(255),random(255),random(255));
   for(;x-10>v*10;x--){
     point(x-10, y);
  }
  stroke(random(255),random(255),random(255));
  for(;y<height-(v*10);y++){
     point(x-10,y); 
  } 
   stroke(random(255),random(255),random(200));
  for(;x < width - (v * 10); x++){
           point(x-10,y);
  } 
  v++;
 }
stop();
}
