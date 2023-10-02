import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../constant/buttons.dart';
import '../../constant/color.dart';
import '../../controller/controller_auth.dart';
import '../HomeScreen/home.dart';
import '../loginScreen/login.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late FocusNode _FName;
  late FocusNode _Lname;
  late FocusNode _Femail;
  late FocusNode _FPassword;
  late FocusNode _Frole;
  late FocusNode submit;
  var _email;
  var _password;

  @override
  void initState() {
    _FName = FocusNode();
    _Lname = FocusNode();
    _Femail = FocusNode();
    _FPassword = FocusNode();
    _Frole = FocusNode();
    submit = FocusNode();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _FName.dispose();
    _Lname.dispose();
    _Femail.dispose();
    _FPassword.dispose();
    _Frole.dispose();
    submit.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  final GlobalKey<FormState> _fromkey = GlobalKey<FormState>();
  TextEditingController FirstNameController = TextEditingController();
  TextEditingController LastNameController = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  TextEditingController RoleController = TextEditingController();
  var auth = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(

        /// bottom navigation  bar with fixed back and continue button
        bottomNavigationBar: Container(
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
                  text: "Back",
                  onTap: (){
                    Get.to(() => Login());
                  },
                ),
              ),
              Container(
                width: 192,
                height: 60,
                child: AuthButton(
                    color: mainColor,
                    text: "SignUp",
                    onTap: () async {
                      if(_fromkey.currentState!.validate()){
                        Map<String, dynamic> userPassJson() => {
                          "firstname":FirstNameController.text,
                          "lastname":LastNameController.text,
                          "email":EmailController.text,
                          "password":PasswordController.text,
                          "role":RoleController.text
                        };
                        print("here is response this body${userPassJson()}");
                        var result= await auth.signup(json.encode(userPassJson()));
                        print("here is response this ${result['status'].runtimeType}");
                        print("here is a token ${result['data']['user']['_id']}");
                        if(result['status'] == "POST Success"){
                          Get.to(() => Login());
                        }
                        else{
                          print("hello success is else ");
                        }
                      }else {
                        print("validate the field");
                      }
                    },
                ),
              ),

            ],
          ),
        ),

        body: SingleChildScrollView(
          child: Form(
            key: _fromkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// animation for the signup from the lottie animations
                Lottie.network(
                  'https://assets5.lottiefiles.com/packages/lf20_dn6rwtwl.json',
                  height: size.height * 0.4,
                  width: size.width,
                ),

                /// text of the firstname field
                Padding(
                  padding: EdgeInsets.only(left: size.width * 0.08),
                  child: Text(
                    "FirstName",
                    style: TextStyle(fontSize: size.width * 0.05),
                  ),
                ),

                /// The text field for the firstname
                Container(
                  margin: EdgeInsets.only(
                      left: size.width * 0.08,
                      right: size.width * 0.08,
                      top: size.width * 0.008,
                      bottom: size.width * 0.08),
                  height: size.width * 0.08,
                  // color: Colors.blue,
                  child: TextFormField(
                    autofocus: true,
                    focusNode: _FName,
                    controller: FirstNameController,
                    validator: (value) {
                      if (value!.isNotEmpty) {
                        return null;
                      } else {
                        return "Enter firstname";
                      }
                    },
                    //keyboardType: TextInputType.phone,

                    enabled: true,
                    textInputAction: TextInputAction.next,
                    style: TextStyle(fontSize: size.width * 0.05, height: 1.5),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: size.width * 0.03,
                          top: size.width * 0.001,
                          bottom: size.width * 0.02),
                      hintText: "john",
                      hintStyle: TextStyle(color: Colors.black.withOpacity(0.25)),
                      border: InputBorder.none,
                      //border: InputBorder.none,
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    onFieldSubmitted: (term) {
                      _FName.unfocus();
                      FocusScope.of(context).requestFocus(_Lname);
                    },
                  ),
                ),

                /// text of the lastname field
                Padding(
                  padding: EdgeInsets.only(left: size.width * 0.08),
                  child: Text(
                    "LastName",
                    style: TextStyle(fontSize: size.width * 0.05),
                  ),
                ),

                /// The text field for the lastname
                Container(
                  margin: EdgeInsets.only(
                      left: size.width * 0.08,
                      right: size.width * 0.08,
                      top: size.width * 0.008,
                      bottom: size.width * 0.08),
                  height: size.width * 0.08,
                  // color: Colors.blue,
                  child: TextFormField(
                    autofocus: true,
                    focusNode: _Lname,
                    controller: LastNameController,
                    validator: (value) {
                      if (value!.isNotEmpty) {
                        _email = value;
                        return null;
                      } else {
                        return "Enter lastname";
                      }
                    },
                    //keyboardType: TextInputType.phone,

                    enabled: true,
                    textInputAction: TextInputAction.next,
                    style: TextStyle(fontSize: size.width * 0.05, height: 1.5),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: size.width * 0.03,
                          top: size.width * 0.001,
                          bottom: size.width * 0.02),
                      hintText: "douh",
                      hintStyle: TextStyle(color: Colors.black.withOpacity(0.25)),
                      border: InputBorder.none,
                      //border: InputBorder.none,
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    onFieldSubmitted: (term) {
                      _Lname.unfocus();
                      FocusScope.of(context).requestFocus(_Femail);
                    },
                  ),
                ),

                /// text of the email field
                Padding(
                  padding: EdgeInsets.only(left: size.width * 0.08),
                  child: Text(
                    "Email",
                    style: TextStyle(fontSize: size.width * 0.05),
                  ),
                ),

                /// The text field for the email
                Container(
                  margin: EdgeInsets.only(
                      left: size.width * 0.08,
                      right: size.width * 0.08,
                      top: size.width * 0.008,
                      bottom: size.width * 0.08),
                  height: size.width * 0.08,
                  // color: Colors.blue,
                  child: TextFormField(
                    autofocus: true,
                    focusNode: _Femail,
                    controller: EmailController,
                    validator: (value) {
                      if (value!.isNotEmpty) {
                        return null;
                      } else {
                        return "Enter email";
                      }
                    },
                    //keyboardType: TextInputType.phone,

                    enabled: true,
                    textInputAction: TextInputAction.next,
                    style: TextStyle(fontSize: size.width * 0.05, height: 1.5),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: size.width * 0.03,
                          top: size.width * 0.001,
                          bottom: size.width * 0.02),
                      hintText: "xyz@gmail.com",
                      hintStyle: TextStyle(color: Colors.black.withOpacity(0.25)),
                      border: InputBorder.none,
                      //border: InputBorder.none,
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    onFieldSubmitted: (term) {
                      _Femail.unfocus();
                      FocusScope.of(context).requestFocus(_FPassword);
                    },
                  ),
                ),

                /// text of the Password field
                Padding(
                  padding: EdgeInsets.only(left: size.width * 0.08),
                  child: Text(
                    "Password",
                    style: TextStyle(fontSize: size.width * 0.05),
                  ),
                ),

                /// The text field for the password
                Container(
                  margin: EdgeInsets.only(
                      left: size.width * 0.08,
                      right: size.width * 0.08,
                      top: size.width * 0.008,
                      bottom: size.width * 0.08
                  ),
                  height: size.width * 0.08,
                  color: Colors.blue,
                  child: TextFormField(
                    autofocus: true,
                    focusNode: _FPassword,
                    controller: PasswordController,
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
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: size.width * 0.03,
                          top: size.width * 0.001,
                          bottom: size.width * 0.02),
                      hintText: "xxxxxx",
                      hintStyle: TextStyle(color: Colors.black.withOpacity(0.25)),
                      border: InputBorder.none,
                      //border: InputBorder.none,
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    onFieldSubmitted: (term) {
                      _FPassword.unfocus();
                      FocusScope.of(context).requestFocus(_Frole);
                    },
                  ),
                ),

                /// text of the Role field
                Padding(
                  padding: EdgeInsets.only(left: size.width * 0.08),
                  child: Text(
                    "Role",
                    style: TextStyle(fontSize: size.width * 0.05),
                  ),
                ),

                /// The text field for the Role
                Container(
                  margin: EdgeInsets.only(
                      left: size.width * 0.08,
                      right: size.width * 0.08,
                      top: size.width * 0.008,
                      bottom: size.width * 0.008,),
                  height: size.width * 0.08,
                  color: Colors.blue,
                  child: TextFormField(
                    autofocus: true,
                    focusNode: _Frole,
                    controller: RoleController,
                    validator: (value) {
                      if (value!.isNotEmpty) {

                        return null;
                      } else {
                        return "Enter Role";
                      }
                    },
                    //keyboardType: TextInputType.phone,

                    enabled: true,
                    textInputAction: TextInputAction.next,
                    style: TextStyle(fontSize: size.width * 0.05, height: 1.5),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: size.width * 0.03,
                          top: size.width * 0.001,
                          bottom: size.width * 0.02),
                      hintText: "123",
                      hintStyle: TextStyle(color: Colors.black.withOpacity(0.25)),
                      border: InputBorder.none,
                      //border: InputBorder.none,
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    onFieldSubmitted: (term) {
                      _Frole.unfocus();
                      FocusScope.of(context).requestFocus(submit);
                    },
                  ),
                ),

                /// text of the login here to move to the login page
                Padding(
                  padding: EdgeInsets.only(
                      left: size.width * 0.08, top: size.height * 0.02),
                  child: Row(
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(fontSize: size.width * 0.03),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => Login());
                        },
                        child: Text(
                          "\t Login here",
                          style: TextStyle(
                              fontSize: size.width * 0.035, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height*0.08,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
