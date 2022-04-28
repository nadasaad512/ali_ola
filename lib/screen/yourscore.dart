import 'package:ali_ola/screen/select.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';


class yourScore extends StatelessWidget{
  String? studentname;
  int? Score;


  yourScore({required this.studentname, required this.Score});
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
      body: Container(

        margin: EdgeInsets.symmetric(horizontal: 20.w,vertical: 50.h),
        child: Center(
          child: Column(
            children:

            [

              Text(" درجتك هي  ",style:GoogleFonts.alata(
                  fontSize: 40,
                  color: Colors.black

              ),),




              SizedBox(height: 30.h,),




              if (Score==15||Score==14)
                LottieBuilder.asset("animations/73862-confetti.json")
              else if (Score==13||Score==12||Score==11||Score==10||Score==9||Score==8||Score==7)
                LottieBuilder.asset("animations/87948-emoji-ok.json")
              else

                LottieBuilder.asset("animations/87947-emoji-cry.json"),

              SizedBox(height: 30.h,),
              Text(("${Score}/15").toString(),style: TextStyle(
                  fontSize: 40
              ),),

            ],
          ),
        ),
      ),
    );
  }
}
