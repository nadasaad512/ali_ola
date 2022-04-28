
import 'package:ali_ola/screen/select.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../utils/helpers.dart';
import 'QuizPlay.dart';

class StudentScreen extends StatefulWidget{
  @override
  State<StudentScreen> createState() => _StudentState();
}

class _StudentState extends State<StudentScreen> with Helpers{
  late TextEditingController _infoTextController;
  late TextEditingController _idquizTextController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _infoTextController = TextEditingController();
    _idquizTextController = TextEditingController();

  }

  @override
  void dispose() {
    // TODO: implement dispose

    _infoTextController.dispose();
    _idquizTextController.dispose();

    super.dispose();
  }
  final Class =["1","2","3","4"];
  final Term =["1","2"];

  String? idClass;
  String? idTerm;

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

      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 30.w),
        child: SingleChildScrollView(

          child: Column(
            children:
            [
              SizedBox(height: 60.h,),
              Text("مرحبا بك عزيزي الطالب ",style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w800
              ),),
              SizedBox(height: 30.h,),
              TextField(
                controller: _infoTextController,

                style: TextStyle(
                  color: Color(0xff0070BA)
                ),

                decoration: InputDecoration(
                  hintText: "أدخل الاسم  ",
                  hintTextDirection: TextDirection.rtl,
                ),
                onChanged: (val) {

                },
              ),
            SizedBox(height: 30.h,),
            DropdownButton(
            hint: Text('اختار صفك'), // Not necessary for Option 1
             value: idClass,
               isExpanded: true,
            borderRadius: BorderRadius.circular(5),

                 style: TextStyle(
                   color: Color(0xff0070BA)
                 ),

              iconSize: 40,
              iconEnabledColor: Color(0xff0070BA),
             onChanged: (value) =>  setState(() => this.idClass= value as String?),

          items: Class.map(buliMenuitems).toList(),
    ),
              SizedBox(height: 30.h,),

              DropdownButton(

                hint: Text('اختار رقم الفصل الدراسي ', textAlign: TextAlign.end,),

                value: idTerm,
                style: TextStyle(
                    color: Color(0xff0070BA)
                ),
                iconSize: 40,


                iconEnabledColor: Color(0xff0070BA),
                isExpanded: true,
                onChanged: (value) =>  setState(() => this.idTerm= value as String?),
                items: Term.map(buliMenuitems).toList(),
              ),
              SizedBox(height: 30.h,),
              TextField(
                style: TextStyle(
                    color: Color(0xff0070BA)
                ),
                controller: _idquizTextController,
                decoration: InputDecoration(
                    hintText: "اكتب رقم الدرس " ,
                  hintTextDirection: TextDirection.rtl,



                ),

              ),


              SizedBox(height: 80.h,),
              ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff0070BA),
                    shape: RoundedRectangleBorder(

                      borderRadius: BorderRadius.circular(10),
                    ),

                    minimumSize: Size(double.infinity, 50),
                  ),



                  onPressed: (){
                    if(_infoTextController.text.isEmpty||_idquizTextController.text.isEmpty||idTerm==null||idClass==null){
                      showSnackBar(context,message: "أدخل البيانات المطلوبة ",error: true);
                    }else{
                      Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) =>QUIZPLAY(studentname: _infoTextController.text,idClass:idClass! ,idTerm:idTerm! ,idQuiz:_idquizTextController.text ,)
                      ));
                    }



                  }, child: Text("انطلق",style: TextStyle(
                fontWeight: FontWeight.w600,


                fontSize: 20,

              ),)),





            ],
          ),
        ),
      ),
    );
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