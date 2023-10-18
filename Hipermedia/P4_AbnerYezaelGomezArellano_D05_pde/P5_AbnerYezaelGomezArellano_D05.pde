float x = 0; // variable para la coordenada x
float t = 0; // variable para el tiempo transcurrido
int puntosPorCiclo = 10; // número de puntos que se dibujarán por ciclo
int boton = 0;
float moverX;
int nivel=5;
//variables, para gusrdar el valor por mientras; ¿
float r_moverX;

PImage pelota;
PImage fondo;

// agregamos esta variable para saber si el botón ha sido presionado
boolean botonPresionado = false;
boolean dibujandoLinea= false; 


void setup() {
  size(1000, 800);
  background(255, 255, 255);
  frameRate(2000);
  pelota = loadImage("pelota.png");
  fondo = loadImage("fondo.jpg");
  moverX= width;
  r_moverX= moverX;
}

int puntosDibujados=0;

void linea() {
  if (botonPresionado) {
    dibujandoLinea = true; // establece la variable a true para indicar que se está dibujando la línea
    if (x < height / 2) {
      float y = height * cos(2 * PI * x / moverX);
      image(pelota, (2 * x), height - y, 100, 100);
      puntosDibujados++;
      x += 3.5;
      t += 1;
      
      // Verificar si la imagen ha salido del lienzo
      if (height - y >=height) {
          x = 0;  // Reiniciar la posición de la imagen en X
          moverX=r_moverX;
      }
    }else{
     x=0; 
    }
  } else {
    image(pelota, 0, 0, 100, 100);
  }
}



void draw() {
  
  image(fondo , 0 , 0 , width , height);
  fill(212, 118, 17);
  rect(width - 100, 10, 80, 50, 10);//boton de +
  textSize(30);
  fill(0);
  text(" + ", width - 72, 45);
  
  fill(212, 118, 17);
  rect(width - 200, 10, 80, 50, 10);//boton de -
  textSize(40);
  fill(0);
  text(" - ", width - 173, 46);
   
  fill(212, 118, 17);
  rect(width - 200, 70, 180, 60, 10);//boton de play
  textSize(40);
  fill(0);
  triangle(width - 120, 91, width - 120, 107, width - 100, 99);
  
  linea();
  
  fill(212, 118, 17);
  rect(width - 200, 140, 180, 60, 10);//boton de nivel del balon
  textSize(40);
  fill(0);
  text(nivel, width - 120, 185);
  
  

  
}

void mousePressed() {
  

}

void mouseClicked(){
 
   if (!dibujandoLinea) { // solo se permite hacer clic en los botones si no se está dibujando la línea
    if(nivel<10){
    if (mouseX > width-100 && mouseX < width-20 && mouseY > 10 && mouseY < 60) { //boton de +
      moverX += 150; 
      nivel++;
      
      fill(215,50,10);
      rect(width-100,10,81,51,10);//boton de + al presionar
      textSize(30);
      fill(0);
      text(" + ",width-72,45);
    }  
    }else if(nivel>0){ 
    if (mouseX > width-200 && mouseX < width-120 && mouseY > 10 && mouseY < 60) { //boton de -

      fill(215,50,10);
      rect(width-200,10,80,50,10);//boton de -
      textSize(40);
      fill(0);
      text(" - ",width-173,46);
      moverX -= 150; 
      nivel--;
      
    }
    }
    
 } 
 if(dibujandoLinea){
   if(nivel<10){
    if (mouseX > width-100 && mouseX < width-20 && mouseY > 10 && mouseY < 60) { //boton de +
      r_moverX += 150; 
      nivel++;
      
      fill(215,50,10);
      rect(width-100,10,81,51,10);//boton de + al presionar
      textSize(30);
      fill(0);
      text(" + ",width-72,45);
      
    }  
    }
    if(nivel>0){ 
    if (mouseX > width-200 && mouseX < width-120 && mouseY > 10 && mouseY < 60) { //boton de -
      fill(215,50,10);
      rect(width-200,10,80,50,10);//boton de -
      textSize(40);
      fill(0);
      text(" - ",width-173,46);
      r_moverX -= 150; 
      nivel--;
      
    }
    }
    

  
 }
  
  //boton de play
 if(mouseX>width-200&&mouseX<width-20&&mouseY>70&&mouseY<130){
  botonPresionado = true; 
  fill(215,50,10);
  rect(width-200,70,180,60,10);//boton de play
  textSize(40);
  fill(0);
  triangle(width-120,91,width-120,107,width-100,99); 
  loop();
  
 }
}
