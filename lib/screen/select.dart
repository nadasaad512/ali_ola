
import 'package:ali_ola/screen/student.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'logain.dart';

class SelectScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          children:
          [
            SizedBox(height: 80.h,),
            Text("من أنت ؟",style: TextStyle(
                fontWeight: FontWeight.w800,
                decoration: TextDecoration.none,
                 fontSize: 30,

            ),),
            SizedBox(height: 80.h,),
            InkWell(
              onTap: (){
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (context) {
                  return StudentScreen();
                }));
              },
              child: Container
                (
                width: 350.w,
                height: 200.h,
                clipBehavior: Clip.antiAlias,

                decoration: BoxDecoration(
                  color: Colors.white70,
                  border: Border.all(
                      color: Color(0xff455a64),
                      width: 2.w
                  ),

                  borderRadius: BorderRadius.circular(20),


                ),
                child: LottieBuilder.asset("animations/21270-student.json"),

              ),
            ),
            SizedBox(height: 50.h,),
            InkWell(
              onTap: (){
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (context) {
                  return LogainScreen();
                }));
              },
              child: Container
                (
                width: 350.w,
                height: 200.h,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Color(0xff455a64),
                      width: 2.w
                  ),
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(20),


                ),
                child: LottieBuilder.asset("animations/21233-teacher.json"),

              ),
            )

          ],
        ),
      ),
    );

  }

}