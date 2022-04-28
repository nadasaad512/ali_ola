import 'package:ali_ola/screen/quiz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../provider/app_Provider.dart';
import '../../utils/helpers.dart';

class ADD_QUIZ extends StatefulWidget{
  String idClass;
  String idTerm;

  ADD_QUIZ({required this.idClass,required this.idTerm});
  @override
  State<ADD_QUIZ> createState() => _ADD_QUIZState();
}

class _ADD_QUIZState extends State<ADD_QUIZ>with Helpers  {
  late TextEditingController _titleTextController;
  late TextEditingController _infoTextController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _titleTextController = TextEditingController();
    _infoTextController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _titleTextController.dispose();
    _infoTextController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Colors.white,
     appBar:  AppBar(
       centerTitle: true,
       backgroundColor: Colors.white,
       elevation: 0,
       title: Text("درس جديد ",style: TextStyle(
           fontWeight: FontWeight.w800,

           fontSize: 30,
           color:Colors.black
       ),),
       leading: IconButton(onPressed: (){
         Navigator.push(
           context,
           MaterialPageRoute(
               builder: (context) => REED_QUIZ(idClass: widget.idClass,idTerm:widget.idTerm,)
           ),
         );
       }, icon: Icon(Icons.arrow_back,color: Colors.black,)),
     ),
     body:  Consumer<AppProvider>(builder: (context, provider, x){
       return  Padding(
         padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
         child: Column(
           children: [
             SizedBox(height: 80.h),
             TextField(
               controller: _titleTextController,
               keyboardType: TextInputType.text,
               decoration: InputDecoration(
                 hintText: 'رقم الدرس ',
               ),
             ),
             SizedBox(height: 15.h),
             TextField(
               controller: _infoTextController,
               keyboardType: TextInputType.text,

               decoration: InputDecoration(
                 hintText: 'اسم االدرس ',
               ),
             ),
             SizedBox(height: 80.h),
             ElevatedButton(
               onPressed: ()async{
                 if(_infoTextController.text.isEmpty||_titleTextController.text.isEmpty){
                   showSnackBar(context,message: "أدخل الحقول المطلوبة ",error: true);
                 }else{
                   await provider.CreatQuiz(idClass: widget.idClass,idTerm:  widget.idTerm ,idQuiz: _titleTextController.text, nameQuiz: _infoTextController.text);
                   Navigator.push(
                     context,
                     MaterialPageRoute(
                         builder: (context) => REED_QUIZ(idClass: widget.idClass,idTerm:widget.idTerm,)
                     ),
                   );
                 }





               },
               child: Text('أضف',style: TextStyle(
                 fontWeight: FontWeight.w600,


                 fontSize: 20,
               ),),
               style:  ElevatedButton.styleFrom(
                 primary: Color(0xff0070BA),
                 shape: RoundedRectangleBorder(

                   borderRadius: BorderRadius.circular(10),
                 ),

                 minimumSize: Size(double.infinity, 50.h),
               ),
             ),
           ],
         ),
       );
     })




   );
  }


}