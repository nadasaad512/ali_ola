class Class {

  late String id;
  late String nameClass;


  Class({required this.id,required this.nameClass});

  Class.fromMap(Map<String, dynamic> map) {

    this.nameClass = map['name'];
    this.id = map['id'];

  }

}