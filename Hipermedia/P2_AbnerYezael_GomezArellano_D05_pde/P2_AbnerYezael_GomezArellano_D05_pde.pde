void setup() {
  size(1000, 500);
}

void draw() {
  int x1 = 0, x2 = width;            
  int y1 = 0,  y2 = height;
  
  int mov = max(width, height);           
  float xmov = (float)(x2 - x1) / mov;    
  float ymov = (float)(y2 - y1) / mov;    

  for (int i = 0; i < mov; i++) {
    point(x1 + (xmov * i), y1 + (ymov * i));
  }
}
