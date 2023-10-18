float x = 0; // variable para la coordenada x
float t = 0; // variable para el tiempo transcurrido
int puntosPorCiclo = 10; // número de puntos que se dibujarán por ciclo

void setup() {
  size(1000, 800);
  background(255, 255, 255);
}

void draw() {
  if (x < width / 2) { // dibuja la curva hasta la mitad del lienzo
    for (int i = 0; i < puntosPorCiclo; i++) {
      float y = height * cos(2 * PI * x / width);
      point(2 * x, height - y);
      x += 0.1; // incremento de x
      t += 1; // incrementa el tiempo transcurrido en 1 milisegundo
    }
  } else { // dibuja una linea en la mitad del lienzo, para checar si se crea correctamente 
    stroke(0, 255, 0);
    for (int i = 0; i < height; i++) {
      point(width / 2, i);
    }
    stop();
  }
}

void mousePressed(){
 
  noLoop(); 

}

void mouseReleased(){
 loop(); 
}
