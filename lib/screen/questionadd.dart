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



  CreatSubject({required this.idClass,required this.idTerm,required this.idQuiz});

  @override
  State<CreatSubject> createState() => _CreatSubjectState();
}

class _CreatSubjectState extends State<CreatSubject> with Helpers{

  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleTextController;
  late TextEditingController _infoTextController;
  late TextEditingController _statmentTextController;
  late TextEditingController _op1TextController;
  late TextEditingController _op2TextController;
  late TextEditingController _op3TextController;
  late TextEditingController _op4TextController;
  late TextEditingController _CorrectTextController;
  late TextEditingController _num_sectionTextController;
  late TextEditingController _sectionTextController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _titleTextController = TextEditingController();
    _infoTextController = TextEditingController();
    _op1TextController = TextEditingController();
    _op2TextController = TextEditingController();
    _op3TextController = TextEditingController();
    _op4TextController = TextEditingController();
    _CorrectTextController = TextEditingController();
    _statmentTextController = TextEditingController();
    _num_sectionTextController = TextEditingController();
    _sectionTextController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _titleTextController.dispose();
    _infoTextController.dispose();
    _op1TextController.dispose();
    _op2TextController.dispose();
    _op3TextController.dispose();
    _op4TextController.dispose();
    _statmentTextController.dispose();
    _CorrectTextController.dispose();
    _num_sectionTextController.dispose();
    _sectionTextController.dispose();
    super.dispose();
  }
  final CorrectAnswerArray =["0","1","2","3"];
  String? correctamswer;
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
                controller: _num_sectionTextController,
                validator: (val) => val!.isEmpty ? "رقم الدرس  " : null,
                decoration: InputDecoration(hintText: " رقم الدرس"),
                onChanged: (val) {

                },
              ),
              TextFormField(
                controller: _sectionTextController,
                validator: (val) => val!.isEmpty ? "اسم  الدرس " : null,
                decoration: InputDecoration(hintText: " اسم  الدرس"),
                onChanged: (val) {

                },
              ),
              TextFormField(
                controller: _statmentTextController,
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
                        : Icon(Icons.camera,color: Colors.blue,)
                        : Icon(Icons.done,color: Colors.blue,),




                )


                ),
                onChanged: (val) {

                },
              ),
              TextFormField(
                controller: _op2TextController,
                textDirection:TextDirection.rtl ,
                validator: (val) => val!.isEmpty ? "أدخل  رقم السؤال " : null,
                decoration: InputDecoration(hintText: " أدخل رقم  السؤال "),
                onChanged: (val) {

                },
              ),
              TextFormField(
                controller: _titleTextController,
                validator: (val) => val!.isEmpty ? "Enter Question" : null,

                decoration: InputDecoration(hintText: "أدخل السؤال " ),
                onChanged: (val) {

                },
              ),
              TextFormField(
                controller: _infoTextController,
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
                        :  Icon(Icons.camera,color: Colors.blue,)
                        : Icon(Icons.done,color: Colors.blue,)




                )

                ),
                onChanged: (val) {

                },
              ),
              TextFormField(
                controller: _op1TextController,
                textDirection:TextDirection.rtl ,
                validator: (val) => val!.isEmpty ? "B- Option2 " : null,
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
                controller:_op3TextController,
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

                controller: _op4TextController,
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
                value: correctamswer,
                isExpanded: true,
                onChanged: (value) =>  setState(() => this.correctamswer= value as String),

                items: CorrectAnswerArray.map(buliMenuitems).toList(),
              ),
              SizedBox(height: 40.h,),

              ElevatedButton(
                onPressed: () async

                {



                  setState(() {
                    loding=true;
                  });

               await   provider.CreatQuestion(
                    idClass: widget.idClass,
                    idTerm: widget.idTerm,
                    idQuiz: widget.idQuiz,

                    idQu: _op2TextController.text,
                    Question: _titleTextController.text,
                    op1: _infoTextController.text,
                    op2: _op1TextController.text,
                    op3: _op3TextController.text,
                    op4: _op4TextController.text,
                    correctanswe: correctamswer,
                    Statment: _statmentTextController.text,
                    new_Section: _num_sectionTextController.text,
                    name_Section: _num_sectionTextController.text,

                  );





                  setState(() {
                    loding=false;
                  });

                  Navigator.pop(context);
                },
                child: loding?
                CircularProgressIndicator():


                Text('أضف ',style: TextStyle(
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