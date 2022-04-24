import 'package:flutter/cupertino.dart';

class Notas2Provider extends ChangeNotifier {
  var notas = [8.2, 7.1, 6.2, 4.4, 3.9, 8.8, 9.1, 5.1];

  void notasAlunosRec() {
    bool Function(double) notaRec = (double nota) => nota < 7;
    var notasRec = notas.where(notaRec);
    print(notasRec);
    notifyListeners();
  }

  void notasAlunosBoas() {
    var notaBoa = (double notasboas) => notasboas >= 7;
    var notaPassou = notas.where(notaBoa);
    print(notaPassou);
    notifyListeners();
  }

  void notasIntermediarias() {
    bool Function (double)
    notaInter = (double not) => not <= 8 && not >= 5;
    var notasInter = notas.where(notaInter);
    print(notasInter);
  }
}