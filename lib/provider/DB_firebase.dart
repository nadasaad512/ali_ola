
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../module/Quiz.dart';
import '../module/Student.dart';
import '../module/question.dart';


class FirestoreHelper {
  FirestoreHelper._();
  static FirestoreHelper firestoreHelper = FirestoreHelper._();
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;


  Future<String> uploadImage(File file) async {
    String filePath = file.path;
    String fileName = filePath.split('/').last;
    Reference reference = firebaseStorage.ref('images/$fileName');
    await reference.putFile(file);
    String imageUrl = await reference.getDownloadURL();
    return imageUrl;
  }







 CreatQuiz (String idClass,String idTerm,String idQuiz, String nameQuiz)async{
    Quiz quiz = Quiz(id: idQuiz, namequiz: nameQuiz);
    await   _firebaseFirestore
        .collection('Classes')
        .doc(idClass)
        .collection('Term')
        .doc(idTerm)
        .collection('Quiz')
        .doc(idQuiz)
        .set(quiz.toMap());

  }
  SetStudent({required String idClass,required String idTerm,required   String idQuiz,required   String Studentname,required int  score})async{
    Student student = Student( Studentname:Studentname ,score: score);
    await   _firebaseFirestore
        .collection('Classes')
        .doc(idClass)
        .collection('Term')
        .doc(idTerm)
        .collection('Quiz')
        .doc(idQuiz)
        .collection('Student')
        .doc()
        .set(student.toMap());

  }


  Future<List<Student>> getAllStudent({required  String idClass,required String idTerm,required String idQuiz} ) async
  {
    QuerySnapshot<Map<String, dynamic>> allProductsSnapshot = await _firebaseFirestore
        .collection('Classes')
        .doc(idClass)
        .collection('Term')
        .doc(idTerm)
        .collection('Quiz')
        .doc(idQuiz)
        .collection('Student')
        .get();


    List<Student> allstudents= allProductsSnapshot.docs.map((e) {
      Student student = Student.fromMap(e.data());
      return student ;
    }).toList();
    return allstudents;
  }
  deleteQuestion({required  String idClass,required String idTerm,required String idQuiz,required String idQu}) async {
    await _firebaseFirestore.
       collection('Classes')
        .doc(idClass)
        .collection('Term')
        .doc(idTerm)
        .collection('Quiz')
        .doc(idQuiz)
        .collection('Question')
        .doc(idQu)
        .delete();
  }
  deleteQuiz({required  String idClass,required String idTerm,required String idQuiz,required String nameQuiz}) async {
    await _firebaseFirestore
        .collection('Classes')
        .doc(idClass)
        .collection('Term')
        .doc(idTerm)
        .collection('Quiz')
        .doc(idQuiz)
        .delete();
  }

  CreatQuestion
      ({
    required  String idClass,
    required String idTerm,
    required String idQuiz,
    required String idQu,
    required  String Question,
    required  String Statment,
     String op1="",
     String op2="",
     String op3="",
    String op4="",
    String? correctanswe,
    String? im_Statment,
    String? name_Section,
    String? new_Section,
    String? im_option1,
    String? im_option2,
    String? im_option3,
    String? im_option4,



      })async{

    Questions questions =
    Questions(
        id: idQu,
        option1: op1,
        option2: op2,
        Question:Question ,
        option3: op3,
        option4: op4,
        Correctanswer: correctanswe,
      Statment: Statment,
      im_option1: im_option1,
      im_option2: im_option2,
      im_option3: im_option3,
      im_option4: im_option4,
      im_Statment: im_Statment,
      name_Section: name_Section,
      new_Section: new_Section



    );
    await  _firebaseFirestore
        .collection('Classes')
        .doc(idClass)
        .collection('Term')
        .doc(idTerm)
        .collection('Quiz')
        .doc(idQuiz)
        .collection('Question')
        .doc(idQu)
        .set(questions.toMap()
    );



  }


  Future<List<Questions>> getAllQuestion({required  String idClass,required String idTerm,required String idQuiz} ) async
  {
    QuerySnapshot<Map<String, dynamic>> allProductsSnapshot = await _firebaseFirestore
        .collection('Classes')
        .doc(idClass)
        .collection('Term')
        .doc(idTerm)
        .collection('Quiz')
        .doc(idQuiz)
        .collection('Question')
        .get();


    List<Questions> allquestions= allProductsSnapshot.docs.map((e) {
      Questions questions = Questions.fromMap(e.data());
      return questions;
    }).toList();
    return allquestions;
  }


  Future<List<Quiz>> getAllQuizes(String idClass,String idTerm) async
  {
    QuerySnapshot<Map<String, dynamic>> allProductsSnapshot = await _firebaseFirestore
        .collection('Classes')
        .doc(idClass)
        .collection('Term')
        .doc(idTerm)
        .collection('Quiz')
        .get();


    List<Quiz> allQuizes= allProductsSnapshot.docs.map((e) {
      Quiz quiz = Quiz.fromMap(e.data());
      return quiz;
    }).toList();
    return allQuizes;
  }



}