import 'package:ali_ola/screen/question.dart';
import 'package:ali_ola/screen/scores.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../provider/app_Provider.dart';

import 'addquiz.dart';
import 'class.dart';

class REED_QUIZ extends StatefulWidget{
  String idClass;
  String idTerm;

  REED_QUIZ({required this.idClass,required this.idTerm});

  @override
  State<REED_QUIZ> createState() => _REED_QUIZState();
}



class _REED_QUIZState extends State<REED_QUIZ> {
  bool isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
   Provider.of<AppProvider>(context,listen: false).getAllQuiz(idClass: widget.idClass, idTerm: widget.idTerm)
       .then((value) {
     isLoading = false;
     setState(() {});
   });
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      backgroundColor: Colors.white,
          appBar: AppBar(
           centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text("الدروس ",style:GoogleFonts.alata(
              fontSize: 30,
              color: Colors.black,
              fontWeight: FontWeight.bold

            ),),

            leading: IconButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => REEDC_CLASS()
                ),
              );
            }, icon: Icon(Icons.arrow_back,color: Colors.black,)),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blue.shade900,

            onPressed: ()
            {

              Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) => ADD_QUIZ(idClass: widget.idClass,idTerm: widget.idTerm,)
              ));

            },
            child: Icon(Icons.add),
          ),

          body:   isLoading ?
              Center(
              child: CircularProgressIndicator(
                color: Colors.blue.shade900,
              ),
            )
                :    Provider.of<AppProvider>(context).Quizes.length==0
                ? Center(
              child: Text('لا يوجد دروس لعرضها !',style: TextStyle(
              fontWeight: FontWeight.w800,
                  fontSize: 30,
                  color:Color(0xff0070BA)
          ),),
            ):

               ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.h),
              itemBuilder: (context, index) {
                return Dismissible(
                  background: Container(
                    alignment: Alignment.center,
                    color: Colors.red,
                    child: Text(
                      'حذف',
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  key: ObjectKey( Provider.of<AppProvider>(context,listen: false).Quizes[index]),
                  onDismissed: (DismissDirection direction)
                  {



                    Provider.of<AppProvider>(context,listen: false).deleteQuiz(idClass:widget. idClass, idTerm: widget.idTerm, idQuiz: Provider.of<AppProvider>(context,listen: false).Quizes[index].id, nameQuiz: Provider.of<AppProvider>(context,listen: false).Quizes[index].namequiz);

                    setState(() {
                      Provider.of<AppProvider>(context,listen: false).Quizes.removeAt(index);
                    });
                  },
                  child: InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => REED_QUESTION(idClass: widget.idClass,idTerm:widget.idTerm ,idQuiz:Provider.of<AppProvider>(context).Quizes[index].id ),
                        ),
                      );
                    },
                    child: Card(

                      elevation: 3,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,

                          children: [
                            TextButton(
                                onPressed: (){
                                  Navigator.pushReplacement(context, MaterialPageRoute(
                                      builder: (context) => ScoreScreen(idClass: widget.idClass,idTerm: widget.idTerm,idQuiz: Provider.of<AppProvider>(context).Quizes[index].id,)
                                  ));

                                }, child: Text("كشف الطلاب ",style: TextStyle(
                                color: Colors.blue.shade900
                            ),)),
                            Spacer(),
                            Text(  Provider.of<AppProvider>(context).Quizes[index].namequiz,style: TextStyle(
                                fontSize: 16
                            ),),
                            SizedBox(width: 20.w,),
                            Text(  " ( ${Provider.of<AppProvider>(context).Quizes[index].id})",style: TextStyle(


                              fontSize: 15,
                              //color:Color(0xff455a64)
                            ),),

                          ],
                        ),
                      ),
                    )
                  ),
                );






              },
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemCount:   Provider.of<AppProvider>(context).Quizes.length,
            )





      );

  }
}