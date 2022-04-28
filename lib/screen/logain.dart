
import 'package:ali_ola/screen/select.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/helpers.dart';
import 'class.dart';

class LogainScreen extends StatefulWidget{
  @override
  State<LogainScreen> createState() => _LogainScreenState();
}

class _LogainScreenState extends State<LogainScreen>with Helpers {
  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }
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
      body: SingleChildScrollView(

        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30.w),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 60.h,),
                Text("أهلا وسهلا بك ",style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w800
                ),),
                SizedBox(height: 60.h),
                Field(
                    controller: _emailTextController,
                    keyboardType: TextInputType.emailAddress,
                    title: 'أدخل الايميل ',

                    prefixIcon: Icon(Icons.email,color: Color(0xff0070BA),)

                ),
                SizedBox(height: 20.h,),
                Field(
                    controller: _passwordTextController,
                    keyboardType: TextInputType.text,
                    title: 'كلمة المرور ',
                    prefixIcon: Icon(Icons.lock,color: Color(0xff0070BA),)

                ),

                SizedBox(height: 80.h),
                ElevatedButton(
                  onPressed: () {


                    if(_emailTextController.text=="aliolaaliola23@gmail.com"&&_passwordTextController.text=="Ali&&Ola123")
                    {
                      Navigator.of(context)
                          .pushReplacement(MaterialPageRoute(builder: (context) {
                        return REEDC_CLASS();
                      }));
                    }else{
                      showSnackBar(context,message: "كلمة المرور او الايميل غير صحيح ",error: true);
                    }
                  },
                  child: Text('الدخول ',style: TextStyle(
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
      ),
    );
  }




  Widget Field({required TextEditingController? controller,required String title, required TextInputType? keyboardType,required Widget? prefixIcon}){
    return  Container(


      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: title,
          hintStyle: TextStyle(
            color:  Color(0xff455a64),
          ),
          suffixIcon: prefixIcon,
          hintTextDirection: TextDirection.rtl,
          enabledBorder: OutlineInputBorder(

              borderSide: BorderSide(
             color: Color(0xff455a64),
              ),
              borderRadius: BorderRadius.circular(5)
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.blue
              ),
              borderRadius: BorderRadius.circular(5)
          ),

        ),
      ),
    );
  }


}