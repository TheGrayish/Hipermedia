float t = 0; // variable para el tiempo transcurrido
int puntosPorCiclo = 10; // número de puntos que se dibujarán por ciclo
int boton = 0;
float moverX;
int nivel=5;


PImage pelota;
PImage fondo;
PImage pelota2;


// agregamos esta variable para saber si el botón ha sido presionado
boolean botonPresionado = false;
boolean dibujandoLinea= false; 

float x=PI*1.5, y, inc_x=0.02, longitud=1;

import processing.sound.*;

SoundFile sonido;
SoundFile s_inicio;
SoundFile s_end;
SoundFile s_game_over;

void setup() {
  size(1300, 800);
  background(255, 255, 255);
  frameRate(2000);
  pelota = loadImage("Frutas.png");
  fondo = loadImage("Fondo2.jpg");
  pelota2 = loadImage("Frutas 2.png");
  moverX= width;
 
  sonido = new SoundFile(this,"Cinderella.mp3");
  s_inicio = new SoundFile(this,"Quintillizas.mp3");
  s_end = new SoundFile(this,"Nya.mp3");
  s_game_over = new SoundFile(this,"Spy_X_Family.mp3");
  
  sonido.play();
}

int puntosDibujados=0;
boolean Par = y %2==0;

void linea() {
  if (botonPresionado) {
    //dibujandoLinea = true; // establece la variable a true para indicar que se está dibujando la línea
    //if (x < height / 2) {
    //  float y = height * cos(2 * PI * x / moverX);
    //  image(pelota, (2 * x), height - y, 400, 400);
    //  puntosDibujados++;
    //  x += 3.5;
    //  t += 1;
      
    //  // Verificar si la imagen ha salido del lienzo
    //  if (height - y >=height) {
    //      x = 0;  // Reiniciar la posición de la imagen en X
    //      moverX=r_moverX;
    //  }
    //}else{
    // x=0; 
    //}
     y = sin(x + inc_x) * height + height;
     
     
  if (Par) {
    image(pelota, (x-PI*1.5)*(width/PI) * longitud, y, 180, 180); 
  } else {
    image(pelota2, (x-PI*1.5)*(width/PI) * longitud, y, 180, 180); 
  }
   
      
   
   
       
    
    if (y > height) {
      
      x = PI*1.5;
      longitud = nivel/5.0; 
          
      if(nivel==0){
       longitud=0.1/5;
       inc_x=0.5;
      }else if(nivel==1){
        inc_x=0.2;
      }else if(nivel==2){
        inc_x=0.1;
      }else{
       inc_x=0.02; 
      }
      s_end.play();   
    }

     
      
      
      x += longitud*inc_x;
      
  
  } else {
    image(pelota, 0, 0, 180, 180);
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
    }
    if(nivel>0){ 
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
 
}

void mouseClicked(){
  //boton de play
 if(mouseX>width-200&&mouseX<width-20&&mouseY>70&&mouseY<130){
  botonPresionado = true; 
  sonido.stop();
  s_inicio.play();
  fill(215,50,10);
  rect(width-200,70,180,60,10);//boton de play
  textSize(40);
  fill(0);
  triangle(width-120,91,width-120,107,width-100,99); 
  loop();  
 }
}
