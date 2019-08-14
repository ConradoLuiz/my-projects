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
