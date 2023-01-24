
void setup() {
  test();
}
  GrandNaturel fibo(int n) {
    int[] suite = new int [n+1];
    suite[0]=1;
    suite[1]=1;
    for (int i=2; i<suite.length; i++) {
      suite[i]=suite[i-1]+suite[i-2];
    }
    return new GrandNaturel(suite[n]);
  }
void test() {
  // Constructeur et accesseurs
  GrandNaturel n1 = new GrandNaturel(100);
  GrandNaturel n2 = new GrandNaturel(3);
  /*assert n1.nbChiffres() == 3;
  assert n1.chiffre(0) == 2;
  assert n1.chiffre(1) == 0;
  assert n1.chiffre(2) == 1;
  // si la position n'est pas valide, le chiffre est considéré comme zéro
  assert n1.chiffre(3) == 0;
  assert n1.chiffre(-1) == 0;
*/
  //assert toString().equals("102");
  println(n1);
  println(n2);
  //assert n1.egal(n2) ;
  //assert n2.inf(n1) ;
  //assert n1.inf(n2) ;
  println("constructeur et accesseurs ok");
  //GrandNaturel n3 = new GrandNaturel(0);
  //n3=n1.plus(n2);
  //println(n1.plus(n2));
  println(n1.mult(3));
  println(fibo(20));
}
