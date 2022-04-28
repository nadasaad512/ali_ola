import 'dart:io';

class Questions {

 late String id;
 late String Question;
 late String Statment;

 String? Correctanswer;



 String option1="";
  String option2="";
  String option3="";
  String option4="";

  String? im_option1;
 String? im_option2;
 String? im_option3;
 String? im_option4;



 String? im_Statment;
  String? new_Section;
  String ?name_Section;





 Questions({
   required this.id,
   required this.Question,
   required this.Statment,
   this.option1="",
   this.option2="",
   this.option3="",
   this.option4='',
    this.Correctanswer,


   this.im_Statment,
   this.name_Section,
  this.new_Section,
   this.im_option1,
 this.im_option2,
  this.im_option3,
   this.im_option4

 });

 Questions.fromMap(Map<String, dynamic> map) {
    this.Question = map['Question'];
    this.option1 = map['option1'];
    this.option2 = map['option2'];
    this.option3 = map['option3'];
    this.option4 = map['option4'];
    this.Correctanswer = map['Correctanswer'];
    this.id = map['id'];
    this.Statment = map['Statment'];
    this.im_Statment = map['im_Statment'];
    this.new_Section = map['new_Section'];
    this.name_Section= map['name_Section'];
    this.im_option1= map['im_option1'];
    this.im_option2= map['im_option2'];
    this.im_option3= map['im_option3'];
    this.im_option4= map['im_option4'];




  }
  toMap() {
    return {
      'Question': this.Question,
      'option1': this.option1,
      'option2': this.option2,
      'option3': this.option3,
      'option4': this.option4,
      'Correctanswer': this.Correctanswer,
      'id': this.id,
      'Statment': this.Statment ,
      'im_Statment': this.im_Statment ,
      'new_Section' : this.new_Section ,
      'name_Section':this.name_Section,
      'im_option1': this.im_option1,
      'im_option2': this.im_option2,
      'im_option3':this.im_option3,
      'im_option4': this.im_option4


    };
  }
}