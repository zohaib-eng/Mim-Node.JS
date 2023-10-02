import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../constant/color.dart';
import '../controller/controller_auth.dart';
import '../screens/Profile/profile.dart';
class DraWer extends StatelessWidget {
   DraWer({Key? key}) : super(key: key);

  var data = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Drawer(
      backgroundColor: white,
      width: size.width * 0.4,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: size.height * 0.18),
            height: size.height * 0.3,
            color: mainlite,
            child: GestureDetector(
              onTap: () {
                Get.to(() => Profile());
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: size.width * 0.02,),
                    child: CircleAvatar(
                      child: Lottie.network("https://assets5.lottiefiles.com/packages/lf20_cz6ukw4q.json"),
                      radius: size.width * 0.05,
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: size.width * 0.02),
                    child: Text("${data.logindata['firstname']} \n ${data.logindata['lastname']}",style: TextStyle(
                        fontSize: size.width * 0.035
                    ),),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
