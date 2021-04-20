import 'package:kit_ofana/db/database.dart';

class Ofana {
  int id;
  String titre;
  String vht1;
  String vht2;
  String vht3;
  String type;
  String sampana;
  String votoatiny;
  bool isDeleted;

  Ofana({
    this.id, 
    this.titre, 
    this.vht1, 
    this.vht2, 
    this.vht3, 
    this.type, 
    this.sampana, 
    this.votoatiny, 
    this.isDeleted
    }
  );

  Map<String, dynamic> toMap() {
    return ({
      'id': id, 
      'titre': titre, 
      'vht1': vht1, 
      'vht2': vht2, 
      'vht3': vht3, 
      'type': type, 
      'sampana': sampana, 
      'votoatiny': votoatiny, 
      'isDeleted': isDeleted, 
    });
  }

  Ofana.fromJson(Map<String, dynamic> json) {
    this.id = json[DBProvider.id];
    this.titre = json[DBProvider.titre];
    this.vht1 = json[DBProvider.vht1];
    this.vht2 = json[DBProvider.vht2];
    this.vht3 = json[DBProvider.vht3];
    this.type = json[DBProvider.type];
    this.sampana = json[DBProvider.sampana];
    this.votoatiny = json[DBProvider.votoatiny];
    this.isDeleted = json[DBProvider.isDeleted] == 1;
  }

  // Task({this.id, this.task, this.dateTime});

  // Map<String, dynamic> toMap() {
  //   return ({'id': id, 'task': task, 'creationDate': dateTime.toString()});
  // }
}