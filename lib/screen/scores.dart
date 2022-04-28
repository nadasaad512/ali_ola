import 'package:ali_ola/screen/quiz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


import '../../provider/app_Provider.dart';

class ScoreScreen extends StatefulWidget{

  String idClass;
  String idTerm;
  String idQuiz;

  ScoreScreen({required this.idClass,required this.idTerm,required this.idQuiz});

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<AppProvider>(context,listen: false).getAllQStudent(idClass: widget.idClass, idTerm: widget.idTerm, idQuiz: widget.idQuiz)
        .then((value) {
      isLoading = false;
      setState(() {});
    });
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

   return  Consumer<AppProvider>(builder: (context, provider, x){

     return  Scaffold(
     backgroundColor:Colors.white ,

       appBar: AppBar(
         centerTitle: true,
         backgroundColor: Colors.white,
         elevation: 0,
         title: Text("العلامات ",style: TextStyle(
             fontWeight: FontWeight.w800,

             fontSize: 30,
             color:Colors.black
         ),),
         leading: IconButton(onPressed: (){
           Navigator.push(
             context,
             MaterialPageRoute(
                 builder: (context) => REED_QUIZ(idClass: widget.idClass,idTerm: widget.idTerm,)
             ),
           );
         }, icon: Icon(Icons.arrow_back,color: Colors.black,)),
       ),
       body:   isLoading ?
       Center(
         child: CircularProgressIndicator(
           color: Colors.blue.shade900,
         ),
       )
           :  provider.students.length==0
           ? Center(
         child:  Text('لا يوجد علامات لعرضها !',style: TextStyle(
             fontWeight: FontWeight.w800,
             fontSize: 30,
             color:Color(0xff0070BA)
         ),),
       ):



       ListView.separated(
         padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
         itemBuilder: (context, index) {
           return  Card(

             elevation: 3,

             child: Container(
               margin: EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text(provider.students[index].score.toString(),style:GoogleFonts.alata(
                     fontSize: 15,

                   ),),
                   SizedBox(width: 20.w,),
                   Text(provider.students[index].Studentname,style:GoogleFonts.alata(
                     fontSize: 25,
                     color: Colors.blue.shade900

                   ),),
                 ],
               ),
             ),
           );



         },
         separatorBuilder: (context, index) {
           return Divider(
             thickness: 1.5,
           );
         },
         itemCount: provider.students.length,
       ),
     );
   });




  }
}