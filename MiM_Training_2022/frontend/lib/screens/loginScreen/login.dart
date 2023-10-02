import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:localstorage/localstorage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:lottie/lottie.dart';
import '../../constant/buttons.dart';
import '../../constant/color.dart';
import '../../constant/loader.dart';
import '../../controller/controller_auth.dart';
import '../HomeScreen/home.dart';
import '../SignUpScreen/sign_up.dart';
import '../dum/dummy.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late FocusNode _Femail;
  late FocusNode _FPassword;
  late FocusNode submit;
  var _email;
  var _password;

  @override
  void initState() {
    _Femail = FocusNode();
    _FPassword = FocusNode();
    submit = FocusNode();
    // TODO: implement initState
    super.initState();
  }



  @override
  void dispose() {
    _Femail.dispose();
    _FPassword.dispose();
    submit.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final LocalStorage storage = LocalStorage('User');
  final GlobalKey<FormState> _fromkey = GlobalKey<FormState>();
  var Auth = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Obx( () => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(

          /// bottom navigation  bar with fixed back and continue button
          bottomNavigationBar: Auth.isLoading.isTrue?
          SizedBox()
              :
          Container(
            height: 70,
            padding: EdgeInsets.only(bottom: 8.0),
            ///     Bottom buttons in the bottomNavigation Bar back and continue
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: size.width * 0.4,
                  height: size.height * 0.1,
                  child: outAuthButton(
                    color: mainColor,
                    text: "Close",
                    onTap: (){
                      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                    },
                  ),
                ),
                Container(
                  width: 192,
                  height: 60,
                  child: AuthButton(
                      color: mainColor,
                      text: "Login",
                      onTap: () async {
                        if(_fromkey.currentState!.validate()){
                          print("validation true");
                          Map<String, dynamic> userPassJson() => {
                            "email":emailController.text,
                            "password":passwordController.text
                          };
                          var result= await Auth.login(json.encode(userPassJson()));
                          print("this is the result ${result.toString()}");
                          if(result['success'] == "true"){
                            Get.to(() => Home());
                          }
                          else{
                            UserDoesnotExist(context);
                          }
                        }

                      }
                  ),
                ),

              ],
            ),
          ),

          body: Auth.isLoading.isTrue?
          Is_Loading()
              :
          SingleChildScrollView(
            child: Form(
              key: _fromkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  GestureDetector(onTap:(){
                    Get.to(() => dummmy());
                  },child: Lottie.network('https://assets5.lottiefiles.com/packages/lf20_dn6rwtwl.json',height: size.height * 0.4,width: size.width,)),

                  Padding(
                    padding: EdgeInsets.only(left: size.width *0.08),
                    child: Text("Email",style: TextStyle(
                      fontSize: size.width * 0.05
                    ),),
                  ),
                  /// The text field for the email
                  Container(
                    margin: EdgeInsets.only(left: size.width *0.08, right: size.width *0.08,top: size.width *0.008, bottom: size.width *0.08),
                    height: size.width * 0.08,
                    // color: Colors.blue,
                    child: TextFormField(
                      autofocus: true,
                      focusNode: _Femail,
                      controller: emailController,
                      validator: (value) {
                        if (value!.isNotEmpty) {
                          _email = value;
                          return null;
                        } else {
                          return "Enter email";
                        }
                      },
                      //keyboardType: TextInputType.phone,

                      enabled: true,
                      textInputAction: TextInputAction.next,
                      style: TextStyle(fontSize: size.width * 0.05, height: 1.5),
                      decoration:  InputDecoration(
                        contentPadding: EdgeInsets.only(left: size.width * 0.03, top: size.width * 0.001, bottom: size.width * 0.02),
                        hintText: "xyz@mail.com",
                        hintStyle: TextStyle(
                            color: Colors.black.withOpacity(0.25)
                        ),
                        border: InputBorder.none,
                        //border: InputBorder.none,
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      onFieldSubmitted: (term){
                        _Femail.unfocus();
                        FocusScope.of(context).requestFocus(_FPassword);
                      },
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: size.width *0.08),
                    child: Text("Password",style: TextStyle(
                        fontSize: size.width * 0.05
                    ),),
                  ),
                  /// The text field for the password
                  Container(
                    margin: EdgeInsets.only(left: size.width *0.08, right: size.width *0.08,top: size.width *0.008),
                    height: size.width * 0.08,
                    color: Colors.blue,
                    child: TextFormField(
                      autofocus: true,
                      focusNode: _FPassword,
                      controller: passwordController,
                      validator: (value) {
                        if (value!.isNotEmpty) {
                          _password = value;
                          return null;
                        } else {
                          return "Enter password";
                        }
                      },
                      //keyboardType: TextInputType.phone,

                      enabled: true,
                      textInputAction: TextInputAction.next,
                      style: TextStyle(fontSize: size.width * 0.05, height: 1.5),
                      decoration:  InputDecoration(
                        contentPadding: EdgeInsets.only(left: size.width * 0.03, top: size.width * 0.001, bottom: size.width * 0.02),
                        hintText: "xxxxxx",
                        hintStyle: TextStyle(
                            color: Colors.black.withOpacity(0.25)
                        ),
                        border: InputBorder.none,
                        //border: InputBorder.none,
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      onFieldSubmitted: (term){
                        _FPassword.unfocus();
                        FocusScope.of(context).requestFocus(submit);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: size.width *0.08, top: size.height*0.02),
                    child: Row(
                      children: [
                        Text("Don't have an account?",style: TextStyle(
                            fontSize: size.width * 0.03
                        ),),
                        GestureDetector(
                          onTap: (){
                            Get.to(() => SignUp());
                          },
                          child: Text("\t signup here",style: TextStyle(
                              fontSize: size.width * 0.035,
                            fontWeight: FontWeight.bold
                          ),),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

        ),
      ),
    );
  }
}



UserDoesnotExist(context) {         ///  pop up when a user doesn't exist
  var size = MediaQuery.of(context).size;
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        contentPadding: EdgeInsets.all(0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 10),
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 40.0,
                child: Lottie.network("https://assets2.lottiefiles.com/packages/lf20_tvjnk4yn.json"),
              ),
              SizedBox(height: 10,),
              const Text(
                "User doesn't exist",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10,),
              // Container(
              //     height: 50,
              //     width: 200,
              //     child: normalButton(
              //       color: mainColor,
              //       text: "Sign Up",
              //       onTap: (){
              //         Get.back();
              //       },
              //     )
              // ),
              // SizedBox(height: 20,),
            ]),
      );
    },
  );
}