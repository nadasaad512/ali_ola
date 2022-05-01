import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


import '../module/Quiz.dart';
import '../module/Student.dart';
import '../module/question.dart';
import 'DB_firebase.dart';

class AppProvider extends ChangeNotifier
{

  List<Quiz> Quizes= [];
  List<Questions> questions= [];
  List<Student> students= [];
  File? file;
  String? imageUrl;


  String? im1_Url;
  File? file1;
  String? im2_Url;
  File? file2;
  String? im3_Url;
  File? file3;
  String? im4_Url;
  File? file4;
  String? correctamswer;


  TextEditingController SectionController = TextEditingController();
  TextEditingController NumSecController = TextEditingController();
  TextEditingController StaController = TextEditingController();
  TextEditingController NumQController = TextEditingController();
  TextEditingController QController = TextEditingController();
  TextEditingController Op1Controller = TextEditingController();
  TextEditingController Op2Controller = TextEditingController();
  TextEditingController Op3Controller = TextEditingController();
  TextEditingController Op4Controller = TextEditingController();







  void popname(){

    imageUrl=null;
    file=null;
    im4_Url=null;
    file4=null;
    im3_Url=null;
    file3=null;
    im2_Url=null;
    file2=null;
    im1_Url=null;
    file1=null;
    NumSecController.clear();
    SectionController.clear();
    StaController.clear();
    NumQController.clear();
    QController.clear();
    Op1Controller.clear();
    Op2Controller.clear() ;
    Op3Controller.clear();
    Op4Controller.clear();
    correctamswer=null;

    notifyListeners();
  }


  editQue(


      {

        required  String idClass,
        required String idTerm,
        required String idQuiz,
        required String idQu,




      }


      ) async {

    if (file != null) {
      this.imageUrl = await FirestoreHelper.firestoreHelper.uploadImage(this.file!);
    }

    if (file1 != null) {
      this.im1_Url = await FirestoreHelper.firestoreHelper.uploadImage(this.file1!);
    }


    if (file2 != null) {
      this.im2_Url = await FirestoreHelper.firestoreHelper.uploadImage(this.file2!);
    }


    if (file3 != null) {
      this.im3_Url = await FirestoreHelper.firestoreHelper.uploadImage(this.file3!);
    }


    if (file4 != null) {
      this.im4_Url = await FirestoreHelper.firestoreHelper.uploadImage(this.file4!);
    }

    Questions questions =Questions(

        option1:Op1Controller.text ,
        Question: QController.text,
        option2: Op2Controller.text,
        option3: Op3Controller.text,
        option4: Op4Controller.text,
        Correctanswer: correctamswer,
        id: NumQController.text,
        Statment: StaController.text,
        im_option1: im1_Url,
        im_option2: im2_Url,
        im_option3: im3_Url,
        im_option4: im4_Url,
        im_Statment: imageUrl,
        name_Section: SectionController.text,
        new_Section: NumSecController.text
    );
    await FirestoreHelper.firestoreHelper.EditCreatQuestion(idClass: idClass, idTerm: idTerm, idQuiz: idQuiz, idQu: idQu, questions: questions);
    await getAllQuestion(idClass: idClass, idTerm: idTerm, idQuiz: idQuiz);

  }



  CreatQuiz ({required String idClass,required String idTerm,required String idQuiz,required String nameQuiz})async{
    await  FirestoreHelper.firestoreHelper.CreatQuiz(idClass, idTerm, idQuiz, nameQuiz);
    getAllQuiz(idTerm:idTerm,idClass: idClass);

  }
  deleteQuestion({required  String idClass,required String idTerm,required String idQuiz,required String idQu}) async {
    await FirestoreHelper.firestoreHelper.deleteQuestion(idClass: idClass, idTerm: idTerm, idQuiz: idQuiz, idQu: idQu);
    getAllQuestion(idClass: idClass,idTerm: idTerm,idQuiz: idQuiz,);
  }
  deleteQuiz({required  String idClass,required String idTerm,required String idQuiz,required String nameQuiz}) async {
    await FirestoreHelper.firestoreHelper.deleteQuiz(idClass: idClass, idTerm: idTerm, idQuiz: idQuiz, nameQuiz: nameQuiz);
    getAllQuiz(idClass: idClass, idTerm: idTerm);
  }



  goToEditQue({required Questions questions,}) {
    this.file = null;
    this.imageUrl = questions.im_Statment;
    this.im4_Url=questions.im_option4;
    this.file4=null;
    this.im3_Url=questions.im_option3;
    this.file3=null;
    this.im2_Url=questions.im_option2;
    this.file2=null;
    this.im1_Url=questions.im_option1;
    this.file1=null;

    Op1Controller.text =questions.option1==null?"":questions.option1!;
    this.correctamswer =questions.Correctanswer;
    QController.text=questions.Question;
    Op2Controller.text=questions.option2==null?"":questions.option2!;
    Op3Controller.text=questions.option3==null?"":questions.option3!;
    Op4Controller.text=questions.option4==null?"":questions.option4!;
    StaController.text=questions.Statment;
    SectionController.text=questions.name_Section!;
    NumSecController.text=questions.new_Section!;
    NumQController.text=questions.id;
    notifyListeners();


  }



  CreatQuestion (

      {

        required  String idClass,
        required String idTerm,
        required String idQuiz,
        required String idQu,




      })async{



    imageUrl =this.file!=null? await FirestoreHelper.firestoreHelper.uploadImage(this.file!):null;
    im1_Url =  this.file1!=null?await FirestoreHelper.firestoreHelper.uploadImage(this.file1!):null;
    im2_Url = this.file2!=null?await FirestoreHelper.firestoreHelper.uploadImage(this.file2!):null;
    im3_Url = this.file3!=null?await FirestoreHelper.firestoreHelper.uploadImage(this.file3!):null;
    im4_Url = this.file4!=null?await FirestoreHelper.firestoreHelper.uploadImage(this.file4!):null;

    Questions questions =Questions(

        option1:Op1Controller.text ,
        Question: QController.text,
        option2: Op2Controller.text,
        option3: Op3Controller.text,
        option4: Op4Controller.text,
        Correctanswer: correctamswer,
        id: NumQController.text,
        Statment: StaController.text,
        im_option1: im1_Url,
        im_option2: im2_Url,
        im_option3: im3_Url,
        im_option4: im4_Url,
        im_Statment: imageUrl,
        name_Section: SectionController.text,
        new_Section: NumSecController.text
    );
    await  FirestoreHelper.firestoreHelper.CreatQuestion(
        idClass: idClass,
        idTerm: idTerm,
        idQuiz: idQuiz,
        idQu: idQu,
        questions: questions





    );
    await getAllQuestion(idClass: idClass, idTerm: idTerm, idQuiz: idQuiz);



    NumSecController.clear();
    SectionController.clear();
    StaController.clear();
    NumQController.clear();
    QController.clear();
    Op1Controller.clear();
    Op2Controller.clear() ;
    Op3Controller.clear();
    Op4Controller.clear();
    correctamswer=null;
    notifyListeners();









  }


  pickNewImage() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
    this.file = File(file!.path);
    notifyListeners();
  }
  pickNewImage1() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
    this.file1 = File(file!.path);
    notifyListeners();
  }
  pickNewImage2() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
    this.file2 = File(file!.path);
    notifyListeners();
  }
  pickNewImage3() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
    this.file3 = File(file!.path);
    notifyListeners();
  }
  pickNewImage4() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
    this.file4 = File(file!.path);
    notifyListeners();
  }
  CreatStudent ({required String idClass,required String idTerm,required   String idQuiz,required  String Studentname,required int  score})async{


    await  FirestoreHelper.firestoreHelper.SetStudent(idClass: idClass, idTerm: idTerm, idQuiz: idQuiz, Studentname: Studentname, score: score);
    getAllQuestion(idClass: idClass, idTerm: idTerm, idQuiz: idQuiz);
  }
  getAllQStudent({required  String idClass,required String idTerm,required String idQuiz}) async {
    this.students= await FirestoreHelper.firestoreHelper.getAllStudent(idClass: idClass, idTerm: idTerm, idQuiz: idQuiz);
    notifyListeners();
  }
  getAllQuiz({required String idClass,required String idTerm}) async {

    this.Quizes = await FirestoreHelper.firestoreHelper.getAllQuizes(idClass, idTerm);
    notifyListeners();
  }
  getAllQuestion({required  String idClass,required String idTerm,required String idQuiz}) async {
    this.questions = await FirestoreHelper.firestoreHelper.getAllQuestion(idClass: idClass, idTerm: idTerm, idQuiz: idQuiz);
    notifyListeners();
  }










}




