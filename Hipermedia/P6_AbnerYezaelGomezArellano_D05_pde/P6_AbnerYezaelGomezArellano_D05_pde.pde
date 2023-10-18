PFont myFont;

float t = 0; // variable para el tiempo transcurrido
int puntosPorCiclo = 10; // número de puntos que se dibujarán por ciclo
float moverX;
int new_nivel=5;
int nivel= 5;

int tiempoInicial; // Variable para el tiempo inicial
int duracionTotal = 60000; // Duración total del temporizador en milisegundos (10 segundos)

PImage pelota;
PImage fondo;
PImage pelota2;
PImage quin1;
PImage quin2;
PImage fondo2;
PImage victory;
PImage bonk;

// agregamos esta variable para saber si el botón ha sido presionado
boolean botonPresionado = false;
boolean dibujandoLinea= true; 

float x=PI*1.5, y, inc_x=0.06, longitud=1, X1;

import processing.sound.*;

SoundFile sonido;
SoundFile s_inicio;
SoundFile s_end;
SoundFile s_game_over;
SoundFile baka;

void setup() {
  size(1300, 800);
  background(255, 255, 255);
  frameRate(2000);
  pelota = loadImage("Frutas.png");
  fondo = loadImage("Fondo2.jpg");
  pelota2 = loadImage("Frutas 2.png");
  quin1= loadImage("quintidiosas 1.png");
  quin2= loadImage("quintidiosas 2.png");
  fondo2= loadImage("Fondo3.jpg");
  victory= loadImage("royale.png");
  bonk= loadImage("Anotacion.png");
  
  moverX= width;
 
  sonido = new SoundFile(this,"Cinderella.mp3");
  s_inicio = new SoundFile(this,"Quintillizas.mp3");
  s_end = new SoundFile(this,"Nya.mp3");
  s_game_over = new SoundFile(this,"Spy_X_Family.mp3");
  baka=  new SoundFile(this,"BAKA.mp3");
  
  sonido.play();
  myFont = loadFont("BradleyHandITC-40.vlw");
  textFont(myFont);
  
}

int puntosDibujados=0;
boolean Par = y %2==0;
boolean terminado = false;
void linea() {
  
  if (botonPresionado) {
      
      if (y > height - 60) {
      y = 0;
      x = PI * 1.5;
     
      baka.play();
      
      
    } else {
      y = sin(x += inc_x) * height + height;
    }

    longitud = nivel / 5.0;
    
    X1 = (x - PI * 1.5) * (width / PI) * longitud;
    
    image(pelota, X1, y, 180, 180);
     if(x==PI * 1.5){
       
        botonPresionado = false;
     }
  }else {
    image(pelota, 0, 0, 180, 180);
    
  }
  
  cuadro();
  if(anotacion){
    image(bonk, width/2+200,0, 250, 400);
  }
}
float x1 = 0; // posición en X de la imagen
float velocidad = 9; // cantidad de píxeles que se mueve la imagen por iteración
int direccion = 1; // dirección del movimiento: 1 = derecha, -1 = izquierda
int con=0;
int puntuacion=0;
boolean anotacion= false; 
void cuadro() {
 
  if (direccion == 1) { // si se mueve hacia la derecha
    x1 += velocidad; // aumenta la posición en X
    if (x1 > width - 200) { // si llega al borde derecho
      x1 = width - 200; // corrige la posición para que no se salga del lienzo
      direccion = -1; // cambia la dirección del movimiento
      con++; // aumenta el contador de intercambio de imágenes
    }
  } else { // si se mueve hacia la izquierda
    x1 -= velocidad; // disminuye la posición en X
    if (x1 < 0) { // si llega al borde izquierdo
      x1 = 0; // corrige la posición para que no se salga del lienzo
      direccion = 1; // cambia la dirección del movimiento
      con++; // aumenta el contador de intercambio de imágenes
    }
  }
  
  // dibuja la imagen en la posición actual
 if (con % 2 == 0) { // si el contador es par, dibuja quin1
 
    image(quin1, x1, height-200, 200, 200);
    // calcula la distancia entre el centro de la pelota y el centro de la imagen quin1
    float distancia = dist(X1, y+90, x1+100, height-100);
    // si la distancia es menor que la suma de los radios de ambos objetos, se produce la colisión
     if (distancia < 150) {
      y = 0;
      x = PI * 1.5; 
      puntuacion += 10; // aumentamos la puntuación
      nivel = new_nivel;
      println("Colision con quin1"); 
      s_end.play();
      botonPresionado=false; 
      anotacion= true; 
      delay(900);  
    }
  } else { // si el contador es impar, dibuja quin2
    image(quin2, x1, height-200, 200, 200);
    // calcula la distancia entre el centro de la pelota y el centro de la imagen quin2
    float distancia = dist(X1, y+90, x1+100, height-100);
    // si la distancia es menor que la suma de los radios de ambos objetos, se produce la colisión
    if (distancia < 150) {
      y = 0;
      x = PI * 1.5;
      nivel = new_nivel;
      puntuacion += 10; // aumentamos la puntuación
      println("Colision con quin2"); 
      s_end.play();
      botonPresionado=false; 
      anotacion= true; 
      delay(900);
    
      }
    }
  
}
///////////////////////////////////////////////////////////////////////////////////DRAW///////////////////////////////////////////////////
boolean iniciando_ando= false;
void draw() { 
  image(fondo2 , 0 , 0 , width , height);
  fill(219, 68, 34);
  rect(width /2-100, height-200, 200, 100, 10);
  fill(0);
  textSize(50);
  text("START",width /2-85, height-135);
  if (!iniciando_ando) {
    t = 0;
  } else {
  cuadritos(); 
  tiempo();
  linea();
     if (iniciando_ando) {
      t = millis() - tiempoInicial;
      }
  if(acabe==true){
    
    image(victory, width/2-350, height/2-400, 700,400);
  
    fill(153, 217, 234);
    rect(width /2-100, height/2-40, 200, 90, 10);    //FINAL SCORE 
    fill(0);
    text(puntuacion,width /2+30, height/2+15);
    text("Final",width /2-94, height/2); 
    text("Score:",width /2-94, height/2+30);
    
    
     fill(153, 217, 234);
     rect(width /2-100, height/2+50, 200, 100, 10);    //RESET 
     fill(0);
     text("RESTART",width /2-94, height/2+110);
  
   
    println("GAME OVER");
    s_game_over.play();
    terminado = true;
    s_inicio.stop();
    
    noLoop();
      
  }
  }
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void mousePressed() {
  
  
    if(new_nivel<10){
    if (mouseX > width-100 && mouseX < width-20 && mouseY > 10 && mouseY < 60) { //boton de +
     
      new_nivel++;
      
      fill(124,24,140);
      rect(width-100,10,81,51,10);//boton de + al presionar
      textSize(30);
      fill(0);
      text(" + ",width-75,45);
    }  
    }
    if(new_nivel>0){ 
    if (mouseX > width-200 && mouseX < width-120 && mouseY > 10 && mouseY < 60) { //boton de -

      fill(124,24,140);
      rect(width-200,10,80,50,10);//boton de -
      textSize(40);
      fill(0);
      text(" - ",width-173,46);
      
      new_nivel--;
      
    }
    }
    
 
}

int numero_puto=0; 
boolean programa=true; 
void mouseClicked(){
  
  if(mouseX> width/2-100&&mouseX<width/2+100&&mouseY>height-200&&mouseY<height-100&&iniciando_ando==false){
  fill(196, 21, 21);
  rect(width /2-100, height-200, 200, 100, 10);
  fill(0);
  textSize(50);
  text("START",width /2-65, height-135);
  iniciando_ando=true;
  int tiempoPasado = millis() - tiempoInicial;
  // Restar el tiempo pasado al tiempo inicial para no afectar el tiempo total
  tiempoInicial = millis() - tiempoPasado;
  
  sonido.stop();
  numero_puto++;
  
  if(numero_puto==1){
  s_inicio.play();
  
  }
  }
  
 //boton de play 
 if(mouseX>width-200&&mouseX<width-20&&mouseY>70&&mouseY<130&&programa){
 if(botonPresionado== false){
   nivel=new_nivel;
 }
  botonPresionado = true; 
  anotacion= false;
  fill(124,24,140);
  rect(width-200,70,180,60,10);//boton de play
  textSize(40);
  fill(0);
  triangle(width-120,91,width-120,107,width-100,99); 
  loop();  
  dibujandoLinea= true;
 }
 
 if(mouseX> width/2-100&&mouseX<width/2+100&&mouseY>height/2+50&&mouseY<height/2+150&&acabe){
 
   loop(); 
   fill(112, 146, 190);
   rect(width /2-100, height/2+50, 200, 100, 10);    //RESET 
   fill(0);
   text("RESTART",width /2-94, height/2+110);
   reset();
   acabe= false;
   programa= true;
  }
  
}


int aux = 0; // inicializando el valor de t0
boolean flag = true; // bandera para el auxiliar
boolean acabe= false;
 int tiempoTranscurrido ;
  int tiempoRestante;
  int segundosRestantes;
  int tiempoActual;
  
  
void tiempo(){
  
   tiempoActual = millis();
  
  //int tiempoTranscurrido = tiempoActual - tiempoInicial; // -> "tiempoInicial" NO hace nada, se queda en 0 siempre
  tiempoTranscurrido = tiempoActual - aux; // -> "tiempoInicial" NO hace nada, se queda en 0 siempre
  tiempoRestante = duracionTotal - tiempoTranscurrido;
  segundosRestantes = ceil(tiempoRestante / 1000.0); // Redondear hacia arriba el tiempo restante en segundos
    println(tiempoActual, aux, tiempoRestante, segundosRestantes);

  //println(duracionTotal, tiempoTranscurrido, tiempoActual); // -> tiempoTranscurrido y tiempoActual son iguales siempre
  aux = flag?tiempoActual:aux; //  Aquí se guarda el valor de "t0" utilizando una bandera para agarrar solo el valor de la primera iteración
  flag = false; // Se baja la bandera para indicar que ya se tomó el valor de la primera iteración

  
  textSize(40);
  fill(0);
  text(segundosRestantes, width - 75, 255); //Tiempo
  
  if (tiempoRestante  <= 0){
  
     acabe= true; 
     anotacion= false;
     programa= false;
  } 
}

void cuadritos(){
  
  image(fondo , 0 , 0 , width , height);
  fill(182, 36, 207);
  rect(width - 100, 10, 80, 50, 10);//boton de +
  textSize(30);
  fill(0);
  text(" + ", width - 75, 45);
  
  fill(182, 36, 207);
  rect(width - 200, 10, 80, 50, 10);//boton de -
  textSize(40);
  fill(0);
  text(" - ", width - 173, 46);
   
  fill(182, 36, 207);
  rect(width - 200, 70, 180, 60, 10);//boton de play
  textSize(40);
  fill(0);
  triangle(width - 120, 91, width - 120, 107, width - 100, 99);
  
   fill(182, 36, 207);
  rect(width - 200, 140, 180, 60, 10);//boton de nivel del balon
  textSize(40);
  fill(0);
  text(new_nivel, width - 120, 185);
    
  fill(182, 36, 207);
  rect(width - 200, 220, 80, 60, 10);//marcador puntuacion
  fill(182, 36, 207);
  rect(width - 200, 260, 80, 30, 5);
  textSize(40);
  fill(0);
  text(puntuacion, width -176, 255); //Puntuacion
  textSize(20);
  text("SCORE", width - 190, 280); //texto de abajo
  
  fill(182, 36, 207);
  rect(width - 100, 220, 80, 60, 10);//marcador tiempo
  fill(182, 36, 207);
  rect(width - 100, 260, 80, 30, 10);
  fill(0);
  textSize(20);
  text("TIME", width - 80, 280); //texto de abajo
  
}

void reset(){
  s_game_over.stop();
  t=0; 
  duracionTotal = 60000;
  puntosPorCiclo = 10;
  new_nivel = 5;
  nivel = 5;
  tiempoInicial = 0;
  botonPresionado = false;
  dibujandoLinea = false;
  x = PI * 1.5;
  y = 0;
  inc_x = 0.06;
  longitud = 1;
  X1 = 0;
  x1 = 0;
  velocidad = 9;
  direccion = 1;
  con = 0;
  puntuacion = 0;
  puntosDibujados = 0;
  Par = y % 2 == 0;
  terminado = false;
  aux=0;
  flag = true;

  s_inicio.play();
  tiempo();
  
}
