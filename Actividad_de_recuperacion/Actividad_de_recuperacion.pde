PImage img, grayImg, redImg, blueImg;
int mode = 0;

void setup() {
  size(1200, 600);
  img = loadImage("QUIN.jpg"); // reemplazar "imagen.jpg" con el nombre de tu archivo de imagen
  grayImg = createImage(img.width, img.height, RGB);
  redImg = createImage(img.width, img.height, RGB);
  blueImg = createImage(img.width, img.height, RGB);
  updateImages();
}

void draw() {
  background(255);
  
   

  
  if (mode == 0) {
    
    image(img, 0, 0);
    
    fill(181,230,20);
    rect(width-220, 110, 200, 60);
    textAlign(CENTER, CENTER);
    textSize(25);
    fill(0);
    text("COLOR ACTUAL:", width-120, 120);
    textSize(25);
    fill(0);
    text("ORIGINAL", width-120, 150);
    
  } else if (mode == 1) {
    
    image(grayImg, 0, 0);
    
    fill(181,230,20);
    rect(width-220, 110, 200, 60);
    textAlign(CENTER, CENTER);
    textSize(25);
    fill(0);
    text("COLOR ACTUAL:", width-120, 120);
    textSize(25);
    fill(0);
    text("GRIS", width-120, 150);
    
  } else if (mode == 2) {
    
    image(redImg, 0, 0);
    
    fill(181,230,20);
    rect(width-220, 110, 200, 60);
    textAlign(CENTER, CENTER);
    textSize(25);
    fill(0);
    text("COLOR ACTUAL:", width-120, 120);
    textSize(25);
    fill(0);
    text("ROJO", width-120, 150);
    
  } else if (mode == 3) {
   
    image(blueImg, 0, 0);
    
    fill(181,230,20);
    rect(width-220, 110, 200, 60);
    textAlign(CENTER, CENTER);
    textSize(25);
    fill(0);
    text("COLOR ACTUAL:", width-120, 120);
    textSize(25);
    fill(0);
    text("AZUL", width-120, 150);
  }
     // dibuja el botón
  fill(181,230,20);
  rect(width-220, 10, 200, 100);
  textAlign(CENTER, CENTER);
  textSize(25);
  fill(0);
  text("PRESIONE PARA", width-120, 40);
  text("CAMBIAR COLOR", width-120, 70);
  
  fill(181,230,20);
  rect(width-220, 170, 200, 30);
  textAlign(CENTER, CENTER);
  textSize(15);
  fill(0);
  text("(Tambien se cambia", width-120, 175);
  text("si se presiona espacio)", width-120, 190);
  
}

void updateImages() {
  // escala de grises
  img.loadPixels();
  grayImg.loadPixels();
  for (int i = 0; i < img.pixels.length; i++) {
    color c = img.pixels[i];
    float grayValue = red(c) * 0.299 + green(c) * 0.587 + blue(c) * 0.114;
    grayImg.pixels[i] = color(grayValue, grayValue, grayValue);
  }
  grayImg.updatePixels();
  
  // escala de rojos
  img.loadPixels();
  redImg.loadPixels();
  for (int i = 0; i < img.pixels.length; i++) {
    color c = img.pixels[i];
    redImg.pixels[i] = color(red(c), 0, 0);
  }
  redImg.updatePixels();
  
  // escala de azules
  img.loadPixels();
  blueImg.loadPixels();
  for (int i = 0; i < img.pixels.length; i++) {
    color c = img.pixels[i];
    blueImg.pixels[i] = color(0, 0, blue(c));
  }
  blueImg.updatePixels();
}

void keyPressed() {
  if (key == ' ') {
    mode = (mode + 1) % 4;
  }
}

void mousePressed() {
 if (mouseX >= width-220 && mouseX <= width-20 && mouseY >= 10 && mouseY <=110) {
    mode = (mode + 1) % 4;
    
  // dibuja el botón presionado
  fill(120,153,19);
  rect(width-220, 10, 200, 100);
  textAlign(CENTER, CENTER);
  textSize(25);
  fill(0);
   text("PRESIONE PARA", width-120, 40);
  text("CAMBIAR COLOR", width-120, 70);          
  } 
}

void mouseReleased(){ 
  updateImages();
}
