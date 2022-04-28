class Student {


  late String Studentname;
  late int score;


  Student({required this.Studentname,required this.score});

  Student.fromMap(Map<String, dynamic> map) {

    this.Studentname = map['Studentname'];
    this.score = map['score'];

  }


  toMap() {
    return {
      'Studentname': this.Studentname,
      'score': this.score,

    };
  }

}