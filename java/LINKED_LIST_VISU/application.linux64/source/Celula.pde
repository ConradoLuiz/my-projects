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
