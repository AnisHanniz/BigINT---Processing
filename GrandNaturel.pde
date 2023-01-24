class GrandNaturel {
  private int[] chiffres;
  private int c;
  // chifres décimaux du moins au plus significatif
  // Crée un grand naturel égal à c
  GrandNaturel(int c) {
    // on s'assure que c est positif
    this.c=c;
  assert c > 0 :
    "on ne représente que les nombres positifs";
    // on commence par calculer le nombre de chiffres
    int nbChiffres = 0;
    for (int c1 = c; c1 > 0; c1 /= 10) {
      nbChiffres++;
    }
    // on crée un tableau de la taille nécessaire
    chiffres = new int[nbChiffres];
    // et on le remplit
    for (int i = 0; i < nbChiffres; i++) {
      chiffres[i] = c % 10;
      c /= 10;
    }
  }
  int nbChiffres() {
    return chiffres.length;
  }
  int chiffre(int pos) {
    if ( pos < chiffres.length && pos >= 0) {
      return chiffres[pos] ;
    } else {
      return 0;
    }
  }
  GrandNaturel (GrandNaturel n) {
    chiffres = new int[n.chiffres.length] ;
    for ( int i = 0; i< chiffres.length; i++ ) { 
      this.chiffres[i] = n.chiffres[i];
    }
  }
  String toString() {
    String chaine = "";
    for (int i = chiffres.length-1; i>=0; i--) {
      chaine += chiffres[i];
    }
    return chaine;
  }
  boolean egal(GrandNaturel n) {
    boolean egal = false;

    if ( chiffres.length == n.chiffres.length) {
      for (int i = 0; i < n.chiffres.length; i++) {
        if ( chiffres[i] == n.chiffres[i]) {
          egal = true;
        } else {
          egal = false;
        }
      }
    } else {
      egal = false;
    }
    return egal;
  }
  boolean sup(GrandNaturel n) {
    boolean sup = false;
    if (chiffres.length > n.chiffres.length) {
      sup=true;
    } else if (chiffres.length < n.chiffres.length) {
      sup=false;
    } else if ( chiffres.length == n.chiffres.length) {
      for (int i = 0; i < n.chiffres.length; i++) {
        if ( chiffres[i] > n.chiffres[i]) {
          sup = true;
        }
      }
    }
    return sup;
  }
  boolean inf(GrandNaturel n) {
    boolean inf = false;
    if (chiffres.length > n.chiffres.length) {
      inf = false;
    }
    if (chiffres.length < n.chiffres.length) {
      inf = true;
    }
    if ( chiffres.length == n.chiffres.length) {
      for (int i = 0; i < chiffres.length; i++) {
        if ( chiffres[i] < n.chiffres[i]) {
          inf=true;
        }
      }
    }

    return inf;
  }

  GrandNaturel plus(int c) {
  assert c >= 0 : 
    "c ne peut pas être négatif"; 
    GrandNaturel resultat = new GrandNaturel(this);
    resultat.chiffres[0] += c;
    resultat.normaliser();
    return resultat;
  }
  void normaliser() {
    int retenue = 0;
    // on sépare chaque chifre en dizaines et unités et on distribue
    // les dizaines vers le chiffre suivant
    for (int i = 0; i < chiffres.length; i++) {
      chiffres[i] += retenue;
      retenue = chiffres[i] / 10;
      chiffres[i] %= 10;
    }
    // s'il restre quelque chose à la fin, on l'ajoute
    if (retenue > 0) {
      GrandNaturel r = new GrandNaturel(retenue);
      chiffres = concat(chiffres, r.chiffres);
    }
  }

  GrandNaturel plus(GrandNaturel n) {
    GrandNaturel somme1 = new GrandNaturel(this);
    GrandNaturel somme2 = new GrandNaturel(n);
    if (nbChiffres()>=n.nbChiffres()) {
      for (int i=chiffres.length-1; i>=0; i--) {
        somme1.chiffres[i]=chiffres[i];
      }
      for (int j=n.chiffres.length-1; j>=0; j--) {
        somme1.chiffres[j]+=n.chiffres[j];
      }
      somme1.normaliser();
      return somme1;
    } else {
      for (int i = chiffres.length-1; i>=0; i--) {
        somme2.chiffres[i]+=chiffres[i];
      }
      somme2.normaliser();
      return somme2;
    }
  }
  GrandNaturel mult(int a) {
    GrandNaturel resultat = new GrandNaturel(c);
    for (int i=0; i< resultat.chiffres.length; i++) {
      resultat.chiffres[i]=0;
    }
    for (int i=1; i<=a; i++) {
      resultat=resultat.plus(c);
    }
    return resultat;
  }
  
  /* Essai
   GrandNaturel mult(GrandNaturel n) {
   GrandNaturel res1 = new GrandNaturel(this);
   GrandNaturel res2 = new GrandNaturel(n);
   if (nbChiffres()>=n.nbChiffres()) {
   for (int i=chiffres.length-1; i>=0; i--) {
   res1.chiffres[i]=chiffres[i];
   }
   for (int j=n.chiffres.length-1; j>=0; j--) {
   for (int k=chiffres.length-1; k>=0; k--) {
   res1.chiffres[j]*=n.chiffres[k];
   }
   }
   res1.normaliser();
   return res1;
   } else {
   for (int j=chiffres.length-1; j>=0; j--) {
   for (int k=chiffres.length-1; k>=0; k--) {
   res2.chiffres[j]*=chiffres[k];
   }
   }
   res2.normaliser();
   return res2;
   }
   }/*
   //Essai
   int fact(GrandNaturel n) {
   int resultat;
   for (int i=1; i<n; i++) {
   resultat=i*i+1;
   }
   return resultat;
   }
   }
   /Question subsidiaire
   Déjà si on prend un 'c' négatif
   */
}
