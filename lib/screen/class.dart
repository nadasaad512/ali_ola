import 'package:ali_ola/screen/quiz.dart';
import 'package:ali_ola/screen/select.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../provider/app_Provider.dart';

class REEDC_CLASS extends StatefulWidget{
  @override
  State<REEDC_CLASS> createState() => _REEDC_CLASSState();
}

class _REEDC_CLASSState extends State<REEDC_CLASS> {
  List Class =["الصف الأول ","الصف الثاني ","الصف الثالث ","الصف الرابع "];
  int idClass = 0 ;
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Colors.white,
     appBar: AppBar(
       backgroundColor: Colors.white,
       elevation: 0,
       leading: IconButton(onPressed: (){


         Navigator.pushReplacement(context, MaterialPageRoute(
             builder: (context) =>SelectScreen()
         ));
       }, icon: Icon(Icons.arrow_back,color: Colors.black,)),
     ),




       body: Consumer<AppProvider>(builder: (context, provider, x){

         return  ListView.builder(
           padding: EdgeInsets.symmetric(horizontal: 20.w,),
           itemBuilder: (context, index) {

             return Container(
               padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
               height: 180.h,

               child: ClipRRect(
                 borderRadius: BorderRadius.circular(8),
                 child: Stack(
                   children: [
                     Image.network(
                      "https://images.unsplash.com/photo-1507842217343-583bb7270b66?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=990&q=80",
                       fit: BoxFit.cover,
                       width: MediaQuery.of(context).size.width,
                     ),
                     Container(
                       color: Colors.black26,
                       child: Center(
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Text(
                             Class[index],
                               style: TextStyle(
                                   fontSize: 30,
                                   color: Colors.white,
                                   fontWeight: FontWeight.w500),
                             ),
                             SizedBox(height: 4.h,),
                             PopupMenuButton<int>(
                               icon: Icon(Icons.menu,color: Colors.white,),

                               offset: Offset(30, 40),
                               color: Colors.white70,
                               onSelected: (int selectedItem) {
                                 if (selectedItem == 1) {
                                   setState(() {
                                     idClass = index+1;
                                   });

                                   Navigator.push(
                                     context,
                                     MaterialPageRoute(
                                       builder: (context) => REED_QUIZ(idClass:idClass.toString(), idTerm: "1"),
                                     ),
                                   );
                                   print (idClass.toString());
                                   print (selectedItem.toString());
                                 } else if (selectedItem == 2)
                                 {
                                   setState(() {
                                     idClass = index+1;
                                   });

                                   Navigator.push(
                                     context,
                                     MaterialPageRoute(
                                       builder: (context) => REED_QUIZ(idClass: idClass.toString(),idTerm: "2"),
                                     ),
                                   );
                                   print (idClass.toString());
                                   print (selectedItem.toString());
                                 }
                               },
                               itemBuilder: (context) {
                                 return [
                                   PopupMenuItem(
                                     child: Text('الفصل الاول '),
                                     value: 1,
                                   ),
                                   PopupMenuItem(
                                     child: Text('الفصل الثاني '),
                                     value: 2,
                                   ),

                                 ];
                               },
                             ),
                           ],
                         ),
                       ),
                     ),

                   ],
                 ),
               ),
             );






           },

           itemCount: 4,
         );
         }),





   );
  }

}