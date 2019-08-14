
ArrayList<Lista> listas = new ArrayList<Lista>();
ArrayList<Pilha> pilhas =  new ArrayList<Pilha>();

boolean pilha = false;

PImage listaInst;
PImage pilhaInst;

void setup() {

  size(1280, 720);
  
  listaInst = loadImage("lista_inst.png");
  pilhaInst = loadImage("pilha_inst.png");

  int n = int(random(50));

  if (!pilha)
    listas.add(new Lista(n));

  else {
    pilhas.add(new Pilha(n));
    //pilhas.get(0).show();
  }
}

void draw() {

  if (!pilha) {

    background(233, 159, 122);
    
    image(listaInst, width/2, height/2);

    textSize(24);
    textAlign(CENTER, CENTER);
    text("Linked List mode", width - 150, 50);

    //if (listas.size() < 1) {
    //  listas.add(new Lista(int(random(50))));
    //}

    int i = 0;
    if (listas.size() > 0) {
      for (Lista l : listas) {
        l.showL(listas.size(), i+1); 
        i++;
      }
    }
  }

  //PILHA --------------------------------

  else {

    background(32, 178, 170);
    
    image(pilhaInst, width/2, height/2);

    fill(255);
    textSize(24);
    textAlign(CENTER, CENTER);
    text("Stack mode", width - 100, 50);

    //if (pilhas.size() < 1) {
    //  pilhas.add(new Pilha(int(random(50))));
    //}

    int j = 0;

    for (Pilha p : pilhas) {
      p.showP(pilhas.size(), j+1);
      //p.show();
      j++;
    }

    //if (frameCount % 100 == 0) {
    //  pilhas.add(new Pilha(3));
    //}
  }
}

//END OF DRAW --------------------------------------

void keyPressed() {

  int n = int(random(50));

  // LISTA--------------------------------------
  if (pilha == false) {
    if (key == 'i' || key == 'I') {
      for (Lista l : listas) {
        l.insereIn(n);
      }
    } else if (key == 'f' || key == 'F') {
      for (Lista l : listas) {
        l.insereFim(n);
      }
    } else if (key == 'r' || key == 'R') {
      for (Lista l : listas) {
        l.retiraIn();
      }
    } else if (key == 'e' || key == 'E') {
      for (Lista l : listas) {
        l.retiraFim();
      }
    } else if (key == 'l' || key == 'L') {
      listas.add(new Lista(n));
    } else if (key == 'j' || key == 'J') {
      if (listas.size() > 0)
        listas.remove(listas.size()-1);
    } else if (key == 's' || key == 'S') {
      if ((listas.size() == 1 && listas.get(0).size() == 0) || listas.size() < 1 )
        pilha = true;
    }
  }

   //PILHA -----------------------------------------

  else {

    if (key == 'i' || key == 'I') {
      for (Pilha p : pilhas) {
        p.insere(int(random(50)));
      }
    } else if (key == 'r' || key == 'R') {
      for (Pilha p : pilhas) {
        p.retira();
      }
    } else if (key == 'p' || key == 'p') {
      pilhas.add(new Pilha(int(random(50))));
    } else if (key == 'o' || key == 'O') {
      if (pilhas.size() > 0)
        pilhas.remove(pilhas.size()-1);   
    } 
    
    else if (key == 's' || key == 'S') {
      if ((pilhas.size() == 1 && pilhas.get(0).size() == 0) || pilhas.size() < 1)
        pilha = false;
      
    }
  }
}


void mousePressed() {
  int n = int(random(50));

  if (pilha == false) {
    for (Lista l : listas)
      l.insereIn(n);
  } else if (pilha == true) {
    if(pilhas.size() < 1){
     pilhas.add(new Pilha(n));
    }
    else{
      for (Pilha p : pilhas) {
        p.insere(n);
      }
   }  
  }
}
