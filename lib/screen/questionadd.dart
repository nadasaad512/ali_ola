import 'package:ali_ola/screen/question.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../provider/app_Provider.dart';
import '../../utils/helpers.dart';

class CreatSubject extends StatefulWidget{

  String idClass;
  String idTerm;
  String idQuiz;
  bool isForEdit;
  String QuetId;



  CreatSubject({required this.idClass,required this.idTerm,required this.idQuiz,this.isForEdit=false,this.QuetId="0"});

  @override
  State<CreatSubject> createState() => _CreatSubjectState();
}

class _CreatSubjectState extends State<CreatSubject> with Helpers{

  final _formKey = GlobalKey<FormState>();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }
  final CorrectAnswerArray =["0","1","2","3"];
  // String? correctamswer;
  bool loding=false;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, provider, x){
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text("سؤال جديد ",style: TextStyle(
              fontWeight: FontWeight.w800,

              fontSize: 30,
              color:Colors.black
          ),),
          leading: IconButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => REED_QUESTION(idClass: widget.idClass,idTerm:widget.idTerm,idQuiz: widget.idQuiz,)
              ),
            );
          }, icon: Icon(Icons.arrow_back,color: Colors.black,)),
        ),
        body:  Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: ListView(

              children: [

                TextFormField(
                  controller: provider.NumSecController,
                  validator: (val) => val!.isEmpty ? "رقم الدرس  " : null,
                  decoration: InputDecoration(hintText: " رقم الدرس"),
                  onChanged: (val) {


                  },
                ),
                TextFormField(
                  controller: provider.SectionController,
                  validator: (val) => val!.isEmpty ? "اسم  الدرس " : null,
                  decoration: InputDecoration(hintText: " اسم  الدرس"),
                  onChanged: (val) {

                  },
                ),
                TextFormField(
                  controller: provider.StaController,
                  textDirection:TextDirection.rtl ,
                  validator: (val) => val!.isEmpty ? "الشرح " : null,
                  decoration: InputDecoration(hintText: " الشرح ",icon: InkWell(
                      onTap: (){
                        provider.pickNewImage();


                      },



                      child:

                      provider.file == null
                          ? provider.imageUrl == null
                          ? Icon(Icons.camera,color: Colors.grey,)
                          :  Icon(Icons.done,color: Colors.blue,)
                          : Icon(Icons.done,color: Colors.blue,)




                  )


                  ),
                  onChanged: (val) {

                  },
                ),
                TextFormField(
                  controller: provider.NumQController,
                  textDirection:TextDirection.rtl ,
                  validator: (val) => val!.isEmpty ? "أدخل  رقم السؤال " : null,
                  decoration: InputDecoration(hintText: " أدخل رقم  السؤال "),
                  onChanged: (val) {

                  },
                ),
                TextFormField(
                  controller: provider.QController,
                  validator: (val) => val!.isEmpty ? "Enter Question" : null,

                  decoration: InputDecoration(hintText: "أدخل السؤال " ),
                  onChanged: (val) {

                  },
                ),
                TextFormField(
                  controller: provider.Op1Controller,
                  textDirection:TextDirection.rtl ,
                  validator: (val) => val!.isEmpty ? "الخيار الاول  " : null,
                  decoration:
                  InputDecoration(hintText: "الخيار الاول ",icon: InkWell(
                      onTap: (){
                        provider.pickNewImage1();
                      },


                      child:  provider.file1 == null ?
                      provider.im1_Url == null ?
                      Icon(Icons.camera,color: Colors.grey,)
                          :  Icon(Icons.done,color: Colors.blue,)
                          : Icon(Icons.done,color: Colors.blue,)




                  )

                  ),
                  onChanged: (val)
                  {

                  },
                ),



                TextFormField(
                  textDirection:TextDirection.rtl ,
                  validator: (val) => val!.isEmpty ? "B- Option2 " : null,
                  // initialValue:widget.isForEdit? provider.questions[widget.QuetId].Question:null,
                  controller: provider.Op2Controller,
                  onEditingComplete: (){

                  },


                  decoration: InputDecoration(hintText: "الخيار الثاني ",icon: InkWell(
                      onTap: (){
                        provider.pickNewImage2();
                      },
                      child:  provider.file2 == null
                          ? provider.im2_Url == null
                          ?  Icon(Icons.camera,color: Colors.grey,)
                          :  Icon(Icons.done,color: Colors.blue,)
                          : Icon(Icons.done,color: Colors.blue,)




                  )),
                  onChanged: (val){

                  },
                ),
                TextFormField(
                  controller: provider.Op3Controller,
                  textDirection:TextDirection.rtl ,
                  validator: (val) => val!.isEmpty ? "C Option1 " : null,
                  decoration:
                  InputDecoration(hintText: "الخيار الثالث ",icon: InkWell(
                      onTap: (){
                        provider.pickNewImage3();
                      },
                      child:  provider.file3 == null
                          ? provider.im3_Url == null
                          ?  Icon(Icons.camera,color: Colors.grey,)
                          :  Icon(Icons.done,color: Colors.blue,)
                          : Icon(Icons.done,color: Colors.blue,)




                  )),
                  onChanged: (val) {

                  },
                ),
                TextFormField(

                  controller:  provider.Op4Controller,
                  textDirection:TextDirection.rtl ,
                  validator: (val) => val!.isEmpty ? "الخيار الرابع " : null,
                  decoration: InputDecoration(hintText: "الخيار الرابع  ",icon: InkWell(
                      onTap: (){
                        provider.pickNewImage4();
                      },
                      child:  provider.file4 == null
                          ? provider.im4_Url == null
                          ?  Icon(Icons.camera,color: Colors.grey,)
                          :  Icon(Icons.done,color: Colors.blue,)
                          : Icon(Icons.done,color: Colors.blue,)




                  )),

                ),
                SizedBox(height: 30.h,),
                DropdownButton(
                  hint: Text('اختار الاجابة الصحيحة  (الخيار الاول يقابله رقم 0)'), // Not necessary for Option 1
                  value: provider.correctamswer,
                  isExpanded: true,
                  onChanged: (value) =>  setState(() => provider.correctamswer= value as String),

                  items: CorrectAnswerArray.map(buliMenuitems).toList(),
                ),
                SizedBox(height: 40.h,),

                ElevatedButton(
                  onPressed: () async

                  {

                    setState(() {
                      loding=true;
                    });


                    widget.isForEdit==false?

                    await   provider.CreatQuestion(
                        idClass: widget.idClass,
                        idTerm: widget.idTerm,
                        idQuiz: widget.idQuiz,

                        idQu: provider.NumQController.text


                    )
                        :
                    await  provider.editQue(
                      idClass: widget.idClass,
                      idTerm: widget.idTerm,
                      idQuiz: widget.idQuiz,
                      idQu: widget.QuetId,


                    );




                    setState(() {
                      loding=false;
                    });

                    Navigator.pop(context);
                  },
                  child: loding?
                  CircularProgressIndicator():


                  Text(widget.isForEdit?"تعديل":'أضف ',style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff0070BA),
                    shape: RoundedRectangleBorder(

                      borderRadius: BorderRadius.circular(10),
                    ),

                    minimumSize: Size(double.infinity, 50.h),
                  ),
                ),



              ],
            ),
          ),
        ),
      );
    });
  }

  DropdownMenuItem<String> buliMenuitems (String item)=>
      DropdownMenuItem(
        value: item,
        child: Text(item,style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
        ),),
      );
}