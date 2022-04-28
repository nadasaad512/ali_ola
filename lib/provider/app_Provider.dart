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

  notifyListeners();
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


   CreatQuestion (

       {required  String idClass,
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

         String im_Statment="",
         String? name_Section,
         String? new_Section,
         String im_option1="",
         String im_option2="",
         String im_option3="",
         String im_option4="",



       })async{



     imageUrl =this.file!=null? await FirestoreHelper.firestoreHelper.uploadImage(this.file!):null;
    im1_Url =  this.file1!=null?await FirestoreHelper.firestoreHelper.uploadImage(this.file1!):null;
     im2_Url = this.file2!=null?await FirestoreHelper.firestoreHelper.uploadImage(this.file2!):null;
    im3_Url = this.file3!=null?await FirestoreHelper.firestoreHelper.uploadImage(this.file3!):null;
    im4_Url = this.file4!=null?await FirestoreHelper.firestoreHelper.uploadImage(this.file4!):null;
     await  FirestoreHelper.firestoreHelper.
     CreatQuestion(
         idClass: idClass,
         idTerm: idTerm,
         idQuiz: idQuiz,
         idQu: idQu,
         Question: Question,
         op1: op1,
         op2: op2,
         op3: op3,
         op4: op4,
         correctanswe: correctanswe,
         Statment: Statment,

         im_option1: im1_Url,
         im_option2: im2_Url,
         im_option3: im3_Url,
         im_option4: im4_Url,
         im_Statment: imageUrl,
         name_Section: name_Section,
         new_Section: new_Section



     );




    getAllQuestion(idClass: idClass, idTerm: idTerm, idQuiz: idQuiz);







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




