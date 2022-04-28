class Quiz {

  late String id;
  late String namequiz;


  Quiz({required this.id,required this.namequiz});



  Quiz.fromMap(Map<String, dynamic> map) {
    this.namequiz = map['namequiz'];
    this.id = map['id'];
  }
  toMap() {
    return {
      'namequiz': this.namequiz,
      'id': this.id
    };
  }
}