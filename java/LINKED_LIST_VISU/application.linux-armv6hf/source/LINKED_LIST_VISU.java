import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class LINKED_LIST_VISU extends PApplet {


ArrayList<Lista> listas = new ArrayList<Lista>();
ArrayList<Pilha> pilhas =  new ArrayList<Pilha>();

boolean pilha = false;

PImage listaInst;
PImage pilhaInst;

public void setup() {

  
  
  listaInst = loadImage("lista_inst.png");
  pilhaInst = loadImage("pilha_inst.png");

  int n = PApplet.parseInt(random(50));

  if (!pilha)
    listas.add(new Lista(n));

  else {
    pilhas.add(new Pilha(n));
    //pilhas.get(0).show();
  }
}

public void draw() {

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

public void keyPressed() {

  int n = PApplet.parseInt(random(50));

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
        p.insere(PApplet.parseInt(random(50)));
      }
    } else if (key == 'r' || key == 'R') {
      for (Pilha p : pilhas) {
        p.retira();
      }
    } else if (key == 'p' || key == 'p') {
      pilhas.add(new Pilha(PApplet.parseInt(random(50))));
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


public void mousePressed() {
  int n = PApplet.parseInt(random(50));

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
public class Celula {

  int valor;
  Celula prox;

  private int x;
  private int y;
  private int w;
  private int h;

  PImage seta;
  PImage downSeta;
  PImage downNull;

  public Celula(int valor) {
    this.valor = valor;

    // this.show(tamanho);
  }

  //LISTA ------------------------------------------------------------------------------------

  public void listaShow(int coordx, int coordy, int tamanho, int sizeL, boolean isNull) {

    this.x = coordx;
    this.y = coordy;
    this.w = (width/2)/ tamanho;
    this.h = (height/2)/(tamanho*sizeL);
    //this.h = (height/2)/ tamanho;

    fill(255);
    rectMode(CENTER);
    rect(this.x, this.y, this.w, this.h);


    strokeWeight(4);
    line(this.x, this.y - (this.h)/2, this.x, this.y + (this.h)/2);

    if (isNull == false) {
      seta = loadImage("arrow.png");

      imageMode(CENTER);
      image(seta, this.x + (this.w)/2, this.y, (this.w)/2, (this.h)/2);
    }
    else{
      downNull = loadImage("down_null.png");

      imageMode(CENTER);
      image(downNull, this.x + (this.w)/4, this.y, this.w/2, this.h);
      
    }

    fill(0);
    textSize(this.h - (this.h/3));
    textAlign(CENTER, CENTER);
    text(this.valor, this.x - (this.w)/4, this.y);
  }

  //PILHA ------------------------------------------------------------------------------------


  public void pilhaShow(int coordx, int coordy, int tamanho, int sizeP, boolean isNull) {

    this.x = coordx;
    this.y = coordy;
    this.w = (width/3)/(tamanho*sizeP);
    this.h = (50+ (height/2))/tamanho;

    fill(255);
    rectMode(CENTER);
    rect(this.x, this.y, this.w, this.h);

    strokeWeight(4);
    line(this.x - (this.w/2), this.y, this.x + (this.w/2), this.y);

    if (isNull == false) {
      downSeta = loadImage("down_arrow.png");
      imageMode(CENTER);
      image(downSeta, this.x, this.y + (this.h/2), this.w, this.h/2 );
    } else {
      downNull = loadImage("down_null.png");
      imageMode(CENTER);
      image(downNull, this.x, this.y + (this.h/4), this.w, this.h);
    }

    fill(0);
    textSize(this.w - (this.w/2) );
    textAlign(CENTER, CENTER);
    text(this.valor, this.x, this.y - (this.h)/4);
  }
}

public class Lista {

  public Celula inicio = null;

  public void insereIn(int valor) {

    Celula cell = new Celula(valor);

    cell.prox = inicio;

    inicio = cell;
  }
  
  public Lista(int n){
   this.insereIn(n); 
  }

  public void insereFim(int valor) {
    if (inicio == null)
      inicio = new Celula(valor);

    else {
      Celula cell = inicio;

      while (cell.prox != null)
        cell = cell.prox;

      cell.prox = new Celula(valor);
    }
  }

  public void retiraFim() {

    if (inicio != null && this.size() > 1) {

      Celula cell = inicio;

      while ((cell.prox).prox != null) {
        cell = cell.prox;
      }

      cell.prox = null;
    }
  }

  public void retiraValor(int valor) {

    if (inicio != null) {

      Celula atual = search(valor);

      if (atual != null) {

        if (atual == inicio) {
          inicio = inicio.prox;
        } else {

          Celula ant = inicio;

          while (ant.prox != atual && ant != null) {
            ant = ant.prox;
          }

          ant.prox = atual.prox;
        }
      }
    }
  }

  public void retiraIn() {
    if (inicio != null) {
      inicio = inicio.prox;
    }
  }

  public void show() {

    Celula cell = inicio;

    while (cell != null) {
      System.out.print(cell.valor + " "); 
      cell = cell.prox;
    }

    System.out.println();
  }

  public Celula search(int valor) {

    if (inicio != null) {

      Celula cell = inicio;

      while (cell.valor != valor && cell != null)
        cell = cell.prox;

      if (cell != null)
        return cell;
    }

    return null;
  }

  public int size() {
    Celula cell = inicio;

    int tamanho = 0;

    while (cell != null) {
      tamanho++;
      cell = cell.prox;
    }

    return tamanho;
  }

  public void showIn(int coord, int recty, int liney){
    
    int x = 70;
    
    recty = recty - recty/4;
    
    fill(0);
    rectMode(CENTER);
    rect(x, recty, 100, 50);
    
    if(inicio != null)
      line(x, recty, coord, liney);
    
    fill(255);
    textAlign(CENTER,CENTER);
    textSize(18);
    text("inicio",x, recty);
    
    
  }

  public void showL(int sizeListas, int j) {

    int tamanhoL = this.size();

    Celula cell = inicio;
    
    int cellx;
    int celly;
    
    boolean isNull = true;

    int i = 1;

    while (cell != null) {
      
      cellx = (i*width)/(tamanhoL+1);
      celly = (j*height)/(sizeListas+1);
      
      if(cell.prox == null)
        isNull = true;
      else
        isNull = false;
      
      cell.listaShow( cellx, celly , tamanhoL, sizeListas, isNull);
      i++;
      cell = cell.prox;
    }
    
    this.showIn((1*width)/(tamanhoL+1), (j*height)/(sizeListas+1), (j*height)/(sizeListas+1) );
  }
}
public class Pilha {

  public Celula inicio = null;

  public Pilha(int n) {
    this.insere(n);
  }

  public void insere(int n) {
    Celula cell = new Celula(n);
    if (inicio != null) {
      cell.prox = inicio;
      inicio = cell;
    } else {
      inicio = cell;
    }
  }

  public void retira() {
    if (this.size() > 1) {
      Celula cell = inicio;
      inicio = cell.prox;
    }
  }

  public int size() {
    Celula cell = inicio;

    int tamanho = 0;

    while (cell != null) {
      tamanho++;
      cell = cell.prox;
    }

    return tamanho;
  }

  public void show() {
    if (inicio != null) {
      Celula cell = inicio; 

      while (cell != null) {
        System.out.print(cell.valor + " ");
        cell = cell.prox;
      }

      System.out.println();
    }
  }
  
  public void showIn(int cellx, int celly, int qtdPilhas){
    
    int x = cellx - (cellx/(2* qtdPilhas));
    int y = 70;
    
    fill(0);
    rectMode(CENTER);
    rect(x, y, 100, 50);
    
    if(inicio != null)
      line(x, y, cellx, celly);
    
    fill(255);
    textAlign(CENTER,CENTER);
    textSize(18);
    text("inicio",x, y);
    
    
  }

  public void showP(int sizePilhas, int j) {

    Celula cell = inicio;

    int cellx;
    int celly;
    
    boolean isNull = true;

    int tamanhoP = this.size();

    int i =1;

    while (cell != null) {

      cellx = (j*width)/(sizePilhas+1);
      celly = (i*height)/(tamanhoP+1);
      
      if(cell.prox == null)
        isNull = true;
      else
        isNull = false;

      cell.pilhaShow(cellx, celly, tamanhoP, sizePilhas, isNull);
      i++;
      cell = cell.prox;
    }
    
    this.showIn((j*width)/(sizePilhas+1) , (1*height)/(tamanhoP+1) , sizePilhas );
  }
}
  public void settings() {  size(1280, 720); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "LINKED_LIST_VISU" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
