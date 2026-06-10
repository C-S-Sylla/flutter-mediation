enum Priorite { basse, moyenne, haute }

class Mediation {
  String id;
  String objet;
  String parties;
  String mediateur;
  DateTime date;
  bool resolu;
  Priorite priorite;

  Mediation({
    required this.id,
    required this.objet,
    required this.parties,
    required this.mediateur,
    required this.date,
    required this.resolu,
    this.priorite = Priorite.moyenne,
  });

  static double calculerTaux(List<Mediation> liste) {
    if (liste.isEmpty) return 0.0;
    int resolus = liste.where((m) => m.resolu).length;
    return (resolus / liste.length) * 100;
  }
}