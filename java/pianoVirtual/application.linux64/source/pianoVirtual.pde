
import processing.sound.*;
//import processing.image.*;

//SinOsc piano[] = new SinOsc(this)[10];

int oitava = 3;

ArrayList<SinOsc> notas;

ArrayList<SinOsc> notas2;

float []naturals = new float[10];

float []sharps = new float[6];

PImage teclado, nomeNotas, a, aSharp, b, bSharp, c, cSharp, d, dSharp, e, f, fSharp, g, gSharp, a2, a2Sharp, b2, b2Sharp, c2;

boolean aGate, aSGate, bGate, bSGate, cGate, cSGate, dGate, dSGate, eGate, fGate, fSGate, gGate, gSGate, a2Gate, a2SGate, b2Gate, c2Gate;

void setup() {

  size(1280, 720);

  teclado = loadImage("piano.png");
  nomeNotas = loadImage("notas.png");
  a = loadImage("A.png");
  aGate = false;

  aSharp = loadImage("A#.png");
  aSGate = false;

  b = loadImage("B.png");
  bGate = false;

  c = loadImage("C.png");
  cGate = false;

  cSharp = loadImage("C#.png");
  cSGate = false;

  d = loadImage("D.png");
  dGate = false;

  dSharp = loadImage("D#.png");
  dSGate = false;

  e = loadImage("E.png");
  eGate = false;

  f = loadImage("F.png");
  fGate = false;

  fSharp = loadImage("F#.png");
  fSGate = false;

  g = loadImage("G.png");
  gGate = false;

  gSharp = loadImage("G#.png");
  gSGate = false;

  a2 = loadImage("AOCTAVE.png");
  a2Gate = false;

  a2Sharp = loadImage("A#OCTAVE.png");
  a2SGate = false;

  b2 = loadImage("BOCTAVE.png");
  b2Gate = false;

  c2 = loadImage("COCTAVE.png");
  c2Gate = false;


  notas = new ArrayList<SinOsc>();
  notas2 = new ArrayList<SinOsc>();  

  naturals[0] = 220;
  naturals[1] = 246.9417;
  naturals[2] = 261.6256;
  naturals[3] = 293.6648;
  naturals[4] = 329.6276;
  naturals[5] = 349.2282;
  naturals[6] = 391.9954;
  naturals[7] = naturals[0] * 2;
  naturals[8] = naturals[1] * 2;
  naturals[9] = naturals[2] * 2;

  sharps[0] = 233.0819;
  sharps[1] = 277.1826;
  sharps[2] = 311.1270;
  sharps[3] = 369.9944;
  sharps[4] = 415.3047;
  sharps[5] = 466.1638;

  for (int i=0; i < 10; i++)
    notas.add(new SinOsc(this));

  for (int i=0; i < 10; i++) {
    SinOsc nota = notas.get(i);
    nota.freq(naturals[i]);
  }

  for (int i=0; i < 6; i++)
    notas2.add(new SinOsc(this));

  for (int i=0; i < 6; i++) {
    SinOsc nota = notas2.get(i);
    nota.freq(sharps[i]);
  }
}



void draw() {

  background(0, 96, 255);

  image(teclado, 0, 0);

  fill(255);
  textSize(20);
  text("Oitava: " + oitava, 67, 50);

  //NATURALS -------------------------

  if (aGate) {
    image(a, 0, 0);
  }

  if (bGate) {
    image(b, 0, 0);
  }

  if (cGate) {
    image(c, 0, 0);
  }

  if (dGate) {
    image(d, 0, 0);
  }

  if (eGate) {
    image(e, 0, 0);
  }

  if (fGate) {
    image(f, 0, 0);
  }

  if (gGate) {
    image(g, 0, 0);
  }

  if (a2Gate) {
    image(a2, 0, 0);
  }

  if (b2Gate) {
    image(b2, 0, 0);
  }

  if (c2Gate) {
    image(c2, 0, 0);
  }

  //SHARPS --------------------------

  if (aSGate) {
    image(aSharp, 0, 0);
  }

  if (cSGate) {
    image(cSharp, 0, 0);
  }

  if (dSGate) {
    image(dSharp, 0, 0);
  }

  if (fSGate) {
    image(fSharp, 0, 0);
  }

  if (gSGate) {
    image(gSharp, 0, 0);
  }

  if (a2SGate) {
    image(a2Sharp, 0, 0);
  }


  //----------------------------------
  //for (Nota nota : notas)
  //  nota.stop();

  image(nomeNotas, 0, 0);
  
 
}

public void upOct() {

  for (int i=0; i < 10; i++) {
    naturals[i] = naturals[i] * 2;
    notas.get(i).freq(naturals[i]);
  }

  for (int i=0; i < 6; i++) {
    sharps[i] = sharps[i] * 2;
    notas2.get(i).freq(sharps[i]);
  }

  oitava++;
}

public void downOct() {
  for (int i=0; i < 10; i++) {
    naturals[i] = naturals[i] / 2.0;
    notas.get(i).freq(naturals[i]);
  }

  for (int i=0; i < 6; i++) {
    sharps[i] = sharps[i] / 2.0;
    notas2.get(i).freq(sharps[i]);
  }

  oitava--;
}


void keyPressed() {

  if (keyCode == UP) {
    upOct();
  }

  if (keyCode == DOWN) {
    downOct();
  }
  //NATURALS---------

  if (key == 'a') {
    //notas.add(new Nota());
    text("A", width/2, height/2);
    notas.get(0).play();
    aGate = true;
  }
  if (key == 's') {
    notas.get(1).play();
    bGate = true;
  }

  if (key == 'd') {
    notas.get(2).play();
    cGate = true;
  }

  if (key == 'f') {
    notas.get(3).play();
    dGate = true;
  }
  if (key == 'g') {
    notas.get(4).play();
    eGate = true;
  }
  if (key == 'h') {
    notas.get(5).play();
    fGate = true;
  }
  if (key == 'j') {
    notas.get(6).play();
    gGate = true;
  }
  if (key == 'k') {
    notas.get(7).play();
    a2Gate = true;
  }
  if (key == 'l') {
    notas.get(8).play();
    b2Gate = true;
  }
  if (key == 'ç') {
    notas.get(9).play();
    c2Gate = true;
  }


  // SHARPS --------------


  if (key == 'w') {
    notas2.get(0).play();
    aSGate = true;
  }

  if (key == 'r') {
    notas2.get(1).play();
    cSGate = true;
  }
  if (key == 't') {
    notas2.get(2).play();
    dSGate = true;
  }
  if (key == 'u') {
    notas2.get(3).play();
    fSGate = true;
  }
  if (key == 'i') {
    notas2.get(4).play();
    gSGate = true;
  }
  if (key == 'o') {
    notas2.get(5).play();
    a2SGate = true;
  }
}

void keyReleased() {

  // NATURALS--------------------

  if (key == 'a') {
    notas.get(0).stop();
    aGate = false;
  }

  if (key == 's') {
    notas.get(1).stop();
    bGate = false;
  }

  if (key == 'd') {
    notas.get(2).stop();
    cGate = false;
  }

  if (key == 'f') {
    notas.get(3).stop();
    dGate = false;
  }
  if (key == 'g') {
    notas.get(4).stop();
    eGate = false;
  }
  if (key == 'h') {
    notas.get(5).stop();
    fGate = false;
  }
  if (key == 'j') {
    notas.get(6).stop();
    gGate = false;
  }
  if (key == 'k') {
    notas.get(7).stop();
    a2Gate = false;
  }
  if (key == 'l') {
    notas.get(8).stop();
    b2Gate = false;
  }
  if (key == 'ç') {
    notas.get(9).stop();
    c2Gate = false;
  }

  // SHARPS----------------

  if (key == 'w') {
    notas2.get(0).stop();
    aSGate = false;
  }

  if (key == 'r') {
    notas2.get(1).stop();
    cSGate = false;
  }
  if (key == 't') {
    notas2.get(2).stop();
    dSGate = false;
  }
  if (key == 'u') {
    notas2.get(3).stop();
    fSGate = false;
  }
  if (key == 'i') {
    notas2.get(4).stop();
    gSGate = false;
  }
  if (key == 'o') {
    notas2.get(5).stop();
    a2SGate = false;
  }
}
