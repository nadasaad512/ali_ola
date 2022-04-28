import 'package:ali_ola/screen/questionadd.dart';
import 'package:ali_ola/screen/quiz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_button/group_button.dart';
import 'package:provider/provider.dart';

import '../../provider/app_Provider.dart';

class REED_QUESTION extends StatefulWidget {
  String idClass;
  String idTerm;
  String idQuiz;

  REED_QUESTION(
      {required this.idClass, required this.idTerm, required this.idQuiz});

  @override
  State<REED_QUESTION> createState() => _REED_QUESTIONState();
}

class _REED_QUESTIONState extends State<REED_QUESTION> {
  bool isLoading = true;
  String? SelectStudent;
  int score = 0;
  bool select = true;







  @override
  void initState() {
    // TODO: implement initState
    Provider.of<AppProvider>(context, listen: false)
        .getAllQuestion(
            idClass: widget.idClass,
            idTerm: widget.idTerm,
            idQuiz: widget.idQuiz)
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
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text("الأسئلة ",style:GoogleFonts.alata(
              fontSize: 30,
              color: Colors.black,
              fontWeight: FontWeight.bold

          ),),



          leading: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => REED_QUIZ(
                            idClass: widget.idClass,
                            idTerm: widget.idTerm,
                          )),
                );
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue.shade900,
          onPressed: () {

            Provider.of<AppProvider>(context,listen: false).popname();
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => CreatSubject(
                          idClass: widget.idClass,
                          idTerm: widget.idTerm,
                          idQuiz: widget.idQuiz,
                        )));


          },
          child: Icon(Icons.add),
        ),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.blue.shade900,
                ),
              )
            : Provider.of<AppProvider>(context).questions.length == 0
                ? Center(
                    child: Text(
                      'لا يوجد أسئلة لعرضها !',
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 30,
                          color: Color(0xff0070BA)),
                    ),
                  )
                : ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.h),
                    itemBuilder: (context, index) {
                      return Dismissible(
                          background: Container(
                            alignment: Alignment.center,
                            color: Colors.red,
                            child: Text(
                              'Delete',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          key: ObjectKey(
                              Provider.of<AppProvider>(context, listen: false)
                                  .questions[index]),
                          onDismissed: (DismissDirection direction) {
                            Provider.of<AppProvider>(context, listen: false)
                                .deleteQuestion(
                                    idClass: widget.idClass,
                                    idTerm: widget.idTerm,
                                    idQuiz: widget.idQuiz,
                                    idQu: Provider.of<AppProvider>(context,
                                            listen: false)
                                        .questions[index]
                                        .id);

                            setState(() {
                              Provider.of<AppProvider>(context, listen: false)
                                  .questions
                                  .removeAt(index);
                            });
                          },
                          child:  Column(

                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [

                                Provider.of<AppProvider>(context).questions[index].new_Section!.isEmpty?SizedBox(): Text(
                                  Provider.of<AppProvider>(context)
                                      .questions[index]
                                      .new_Section!,
                              style:GoogleFonts.alata(
                              fontSize: 20,
                              color: Colors.blue.shade900,
                              fontWeight: FontWeight.bold

                          ),
                                ),
                                Provider.of<AppProvider>(context).questions[index].new_Section!.isEmpty? SizedBox(): SizedBox(
                                  height: 10.h,
                                ),
                                Provider.of<AppProvider>(context).questions[index].name_Section!.isEmpty?SizedBox(): Text(
                                  Provider.of<AppProvider>(context)
                                      .questions[index]
                                      .name_Section!,
                                  style:GoogleFonts.alata(
                                      fontSize: 15,
                                      color: Colors.blue.shade700,


                                  ),
                                ),
                                Provider.of<AppProvider>(context).questions[index].name_Section!.isEmpty? SizedBox(): SizedBox(
                                  height: 10.h,
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Provider.of<AppProvider>(context).questions[index].im_Statment == null ? Container() : Container(
                                      width: 70.w,
                                      height:70.h,
                                      decoration: BoxDecoration(
                                          color: Colors.blue.shade900,
                                          borderRadius: BorderRadius.circular(5),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                Provider.of<AppProvider>(
                                                    context)
                                                    .questions[index]
                                                    .im_Statment!),
                                          )
                                      ),
                                    ),
                                    Text(
                                      Provider.of<AppProvider>(context)
                                          .questions[index]
                                          .Statment,
                                      style:GoogleFonts.alata(
                                          fontSize: 15,
                                          color: Colors.black,


                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),

                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        Provider.of<AppProvider>(context)
                                            .questions[index]
                                            .Question,
                                        style:GoogleFonts.alata(
                                          fontSize: 20,
                                          color: Colors.black,


                                        ),
                                      ),
                                      Text(
                                        "- (${Provider.of<AppProvider>(context).questions[index].id})",
                                        style:GoogleFonts.alata(
                                          fontSize:15,
                                          color: Colors.black,


                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 30.h,
                                ),


                                Provider.of<AppProvider>(context).questions[index].option1.isEmpty? Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 70.w,
                                      height:70.h,
                                      decoration: BoxDecoration(
                                          color: Colors.blue.shade900,
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

                                    Container(
                                      width: 70.w,
                                      height:70.h,
                                      decoration: BoxDecoration(
                                          color: Colors.blue.shade900,
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

                                    Container(
                                      width: 70.w,
                                      height:70.h,
                                      decoration: BoxDecoration(
                                          color: Colors.blue.shade900,
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

                                    Container(
                                      width: 70.w,
                                      height:70.h,
                                      decoration: BoxDecoration(
                                          color: Colors.blue.shade900,
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
                                ): Center(

                                  child: GroupButton(
                                    isRadio: true,
                                    onSelected: (inde, num, isSelect) {
                                    },
                                    options: GroupButtonOptions(
                                        selectedTextStyle: GoogleFonts.alata(
                                          fontSize: 15,

                                        ),
                                        unselectedTextStyle: GoogleFonts.alata(
                                            fontSize: 15,
                                            color: Colors.black

                                        ),

                                        unselectedColor: Colors.grey.shade300,
                                        selectedColor: Colors.blue.shade900,
                                        spacing: 20.w,
                                        borderRadius: BorderRadius.circular(15)

                                    ),

                                    buttons: [

                                      Provider.of<AppProvider>(context)
                                          .questions[index]
                                          .option1,
                                      Provider.of<AppProvider>(context)
                                          .questions[index]
                                          .option2,
                                      Provider.of<AppProvider>(context)
                                          .questions[index]
                                          .option3,
                                      Provider.of<AppProvider>(context)
                                          .questions[index]
                                          .option4
                                    ],
                                  ),
                                ),
                                SizedBox(height: 15.h,),
                                Provider.of<AppProvider>(context).questions[index].option1.isEmpty? Center(

                                  child: GroupButton(


                                    isRadio: true,
                                    onSelected: (inde, num, isSelect) {






                                    },
                                    options: GroupButtonOptions(
                                      selectedTextStyle: GoogleFonts.alata(
                                        fontSize: 15,

                                      ),
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
                                      spacing: 70.w,


                                    ),

                                    buttons: [
                                      "1",
                                      "2",
                                      "3",
                                      "4",
                                    ],
                                  ),
                                ):SizedBox(),













                              ])



                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                    itemCount:
                        Provider.of<AppProvider>(context).questions.length,
                  ));
  }
}
