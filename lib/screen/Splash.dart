import 'package:ali_ola/screen/select.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3)).then((v) {

      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return SelectScreen();
      }));


    });

    return Container
      (
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: AlignmentDirectional.bottomEnd,
          end: AlignmentDirectional.topEnd,
          colors: [
            Colors.blue.shade900,
            Colors.white70,
            Colors.blue.shade900,
          ],
        ),
      ),
      child: Center(
        child: Image.asset("images/1 (1).png",)
      ),

    );
  }

}