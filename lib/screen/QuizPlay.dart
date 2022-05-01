
import 'package:ali_ola/screen/select.dart';
import 'package:ali_ola/screen/yourscore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_button/group_button.dart';
import 'package:provider/provider.dart';
import '../../provider/app_Provider.dart';

class QUIZPLAY extends StatefulWidget{
  String studentname;
  String idClass;
  String idTerm;
  String idQuiz;


  QUIZPLAY({required this.studentname,required this.idClass,required this.idTerm,required this.idQuiz});
  @override
  State<QUIZPLAY> createState() => _QUIZPLAYState();
}

class _QUIZPLAYState extends State<QUIZPLAY> {
  int  Score=0 ;
  bool isLoading = true;
  bool Select=false;
  int index=0;





  @override
  void initState() {
    // TODO: implement initState
    Provider.of<AppProvider>(context,listen: false).getAllQuestion(idClass:widget.idClass, idTerm:widget. idTerm, idQuiz: widget.idQuiz)
        .then((value) {
      isLoading = false;
      setState(() {});
    });
    super.initState();

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SelectScreen()
              ),
            );
          }, icon: Icon(Icons.arrow_back,color: Colors.black,)),
        ),

        body:  isLoading?
        Center(
          child: CircularProgressIndicator(),
        )
            : Provider.of<AppProvider>(context).questions.length==0?
        Center(
          child: Text('لا يوجد درس! ',style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 30,
              color:Color(0xff0070BA)
          ),),
        )
            :
        SingleChildScrollView(

          child: Container(

            margin: EdgeInsets.symmetric(horizontal: 20.w,vertical:30.h),
            child: Column(

              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(" ${widget.studentname}",style:GoogleFonts.alata(
                      fontSize: 30,

                    ),),
                    SizedBox(width: 20.w,),
                    Text(" 👋 مرحبا ",style:GoogleFonts.alata(
                      fontSize: 30,

                    ),),

                  ],
                ),




                SizedBox(
                  height: 70.h,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    Text( Provider.of<AppProvider>(context).questions[index].Question,style:GoogleFonts.alata(
                      fontSize: 30,

                    ),),
                    Text( "  - ${index+1}",style:GoogleFonts.alata(
                      fontSize: 20,

                    ),),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),



                if (Provider.of<AppProvider>(context).questions[index].option1==null) Align(
                  alignment: Alignment.topRight,

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(

                        children: [
                          Container(
                            width: 200.w,
                            height:100.h,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      Provider.of<AppProvider>(
                                          context)
                                          .questions[index]
                                          .im_option1!),
                                )
                            ),
                          ),
                          SizedBox(height: 30.h,),

                          Container(
                            width: 200.w,
                            height:100.h,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      Provider.of<AppProvider>(
                                          context)
                                          .questions[index]
                                          .im_option2!),
                                )
                            ),
                          ),
                          SizedBox(height: 30.h,),

                          Container(
                            width: 200.w,
                            height:100.h,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      Provider.of<AppProvider>(
                                          context)
                                          .questions[index]
                                          .im_option3!),
                                )
                            ),
                          ),
                          SizedBox(height: 30.h,),

                          Container(
                            width: 200.w,
                            height:100.h,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      Provider.of<AppProvider>(
                                          context)
                                          .questions[index]
                                          .im_option4!),
                                )
                            ),
                          ),

                        ],
                      ),
                      SizedBox(width: 30.w,),
                      GroupButton(
                        isRadio: true,
                        onSelected: (inde, num, isSelect) {
                          if( num== Provider.of<AppProvider>(context,listen: false).questions[index].Correctanswer){
                            setState(() {

                              Select=true;
                            });
                          }else{
                            setState(() {
                              Select=false;
                            });
                          }

                        },
                        options: GroupButtonOptions(
                            selectedTextStyle: GoogleFonts.alata(
                              fontSize: 15,

                            ),
                            direction: Axis.vertical,
                            unselectedTextStyle: GoogleFonts.alata(
                                fontSize: 15,
                                color: Colors.black

                            ),
                            unselectedColor: Colors.grey.shade300,
                            selectedColor: Colors.blue.shade900,
                            alignment: Alignment.center,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            buttonWidth: 30.w,
                            buttonHeight: 30.h,
                            spacing: 100.h,
                            textAlign: TextAlign.center



                        ),

                        buttons: [

                          " أ ${ Provider.of<AppProvider>(context)
                              .questions[index]
                              .option1}",
                          "ب ${ Provider.of<AppProvider>(context)
                              .questions[index]
                              .option2}",
                          " ج ${ Provider.of<AppProvider>(context)
                              .questions[index]
                              .option3}",
                          " د  ${ Provider.of<AppProvider>(context)
                              .questions[index]
                              .option4}",
                        ],
                      ),
                    ],

                  ),
                ) else Align(
                  alignment: Alignment.topRight,

                  child: GroupButton(


                    isRadio: true,
                    onSelected: (inde, num, isSelect) {
                      print(num);
                      print(Select);
                      print(Provider.of<AppProvider>(context,listen: false).questions[index].Correctanswer);
                      if( num.toString() == Provider.of<AppProvider>(context,listen: false).questions[index].Correctanswer.toString()){
                        setState(() {

                          Select=true;
                        });
                      }else{
                        setState(() {
                          Select=false;
                        });
                      }
                      print(Select);



                    },
                    options: GroupButtonOptions(
                        selectedTextStyle: GoogleFonts.alata(
                          fontSize: 15,

                        ),
                        unselectedTextStyle: GoogleFonts.alata(
                            fontSize: 15,
                            color: Colors.black

                        ),
                        direction: Axis.vertical,

                        unselectedColor: Colors.grey.shade300,
                        selectedColor: Colors.blue.shade900,
                        alignment: Alignment.center,

                        spacing: 20.w,
                        borderRadius: BorderRadius.circular(15)




                    ),

                    buttons: [

                      " أ -${ Provider.of<AppProvider>(context)
                          .questions[index]
                          .option1}",
                      " ب -${ Provider.of<AppProvider>(context)
                          .questions[index]
                          .option2}",

                      " ج -${ Provider.of<AppProvider>(context)
                          .questions[index]
                          .option3}",

                      " د -${ Provider.of<AppProvider>(context)
                          .questions[index]
                          .option4}",
                    ],
                  ),
                ),
                SizedBox(height: 20.h,),



                SizedBox(height: 30.h),


                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue.shade900,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),

                      minimumSize: Size(double.infinity, 50.h),
                    ),

                    onPressed: (){


                      if(Select==true){
                        Score++;
                      }



                      if(index<9){
                        setState(() {
                          index++;
                        });
                      }
                      else{
                        Provider.of<AppProvider>(context,listen: false).CreatStudent(idClass: widget.idClass, idTerm: widget.idTerm, idQuiz: widget.idQuiz, Studentname: widget.studentname, score: Score);
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
                          return yourScore(studentname: widget.studentname,Score: Score ,);
                        }));
                      }
























                    }, child: Text(index==9?"لنرى النتيجة معا ":"التالي "))
              ],
            ),
          ),
        )
    );

  }
}
