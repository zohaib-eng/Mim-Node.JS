import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_assign/constant/color.dart';
import 'package:get/get.dart';
import 'package:test_assign/controller/controller_auth.dart';
import '../../AssetsWidget/drawer.dart';
import '../../AssetsWidget/fieldclass.dart';
import '../../constant/buttons.dart';
import '../HomeScreen/home.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  late FocusNode _FName;
  late FocusNode _LName;
  late FocusNode _Femail;
  late FocusNode _FPassword;
  late FocusNode _Frole;
  late FocusNode submit;

  var profile = Get.put(Controller());
  final GlobalKey<FormState> _fromkey = GlobalKey<FormState>();
  TextEditingController FirstNameController = TextEditingController();
  TextEditingController LastNameController = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  TextEditingController RoleController = TextEditingController();

  @override
  void initState() {
    _FName = FocusNode();
    _LName = FocusNode();
    _Femail = FocusNode();
    _FPassword = FocusNode();
    _Frole = FocusNode();
    submit = FocusNode();
print("hellow this is the ${profile.logindata['firstname']}");
    FirstNameController.text = profile.logindata['firstname'];
    EmailController.text = profile.logindata['email'];
    LastNameController.text = profile.logindata['lastname'];
    PasswordController.text = profile.logindata['password'];
    RoleController.text = profile.logindata['role'].toString();

    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _FName.dispose();
    _LName.dispose();
    _Femail.dispose();
    _FPassword.dispose();
    _Frole.dispose();
    submit.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: white,
      key: _key,

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
                  text: "Update",
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
                      var result= await profile.updateProfile(json.encode(userPassJson()));
                      print("here is response this ${result['status'].runtimeType}");
                      // print("here is a token ${result['data']['user']['_id']}");
                      if(result['status'] == "POST Success"){
                        Get.to(() => Home());
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

      drawer: DraWer(),
      body: SingleChildScrollView(
        child: Form(
          key: _fromkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  Container(
                    width: size.width,
                    height: size.height * 0.4,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(180),
                          bottomRight: Radius.circular(180)),
                      child: Image.network(
                        "https://loremflickr.com/g/320/240/paris,girl/all",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    right: size.width * 0.15,
                    bottom: size.height * 0.02,
                    child: CircleAvatar(
                      backgroundColor: mainColor,
                      radius: size.width * 0.050,
                      child: CircleAvatar(
                        backgroundColor: mainlite,
                        radius: size.width * 0.046,
                        child: Icon(
                          Icons.camera,
                          color: white,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.04,
                    left: size.width * 0.02,
                    child: GestureDetector(
                      onTap: (){
                        _key.currentState!.openDrawer();
                      },
                      child: Icon(
                        Icons.menu_sharp,
                        color: mainColor,
                        size: size.width * 0.1,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10,),
              Padding(
                padding: EdgeInsets.only(left: size.width * 0.08, bottom: size.width * 0.01),
                child: Text("First Name"),
              ),
              ConstField(
                controller: FirstNameController,
                focus: _FName,
                Nextfocus: _LName,
                error: "Enter username",
                hint: "john123",
              ),
              Padding(
                padding: EdgeInsets.only(left: size.width * 0.08, bottom: size.width * 0.01),
                child: Text("Last Name"),
              ),
              ConstField(
                controller: LastNameController,
                focus: _Femail,
                Nextfocus: _FPassword,
                error: "Enter mobile number",
                hint: "03002341432",
              ),
              Padding(
                padding: EdgeInsets.only(left: size.width * 0.08, bottom: size.width * 0.01),
                child: Text("Email"),
              ),
              ConstField(
                controller: EmailController,
                focus: _LName,
                Nextfocus: _Femail,
                error: "Enter email",
                hint: "xyz@mail.com",
              ),
              Padding(
                padding: EdgeInsets.only(left: size.width * 0.08, bottom: size.width * 0.01),
                child: Text("Password"),
              ),
              ConstField(
                controller: PasswordController,
                focus: _FPassword,
                Nextfocus: _Frole,
                error: "Enter password",
                hint: "********",
              ),
              Padding(
                padding: EdgeInsets.only(left: size.width * 0.08, bottom: size.width * 0.01),
                child: Text("Role"),
              ),
              ConstField(
                controller: RoleController,
                focus: _Frole,
                Nextfocus: submit,
                error: "Enter password",
                hint: "********",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
