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
