import 'package:ali_ola/provider/app_Provider.dart';
import 'package:ali_ola/screen/Splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';




void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      ChangeNotifierProvider<AppProvider>(
          create: (context) => AppProvider(),

          child:  MyApp()
      )


  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return   ScreenUtilInit(
        designSize: Size(411, 820),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_) {
          return   MaterialApp(
              debugShowCheckedModeBanner: false,
              useInheritedMediaQuery: true,
              home: SplashScreen()
          );
        }
    );




  }
}


