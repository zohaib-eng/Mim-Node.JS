import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../AssetsWidget/drawer.dart';
import '../../constant/buttons.dart';
import '../../constant/color.dart';
import '../../controller/controller_auth.dart';
import '../Profile/profile.dart';
import 'component/card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  var data = Get.put(Controller());

  @override
  void initState() {
    Map<String, dynamic> userPassJson() => {
      "email":"${data.logindata['email']}",
    };
    data.getdata(json.encode(userPassJson()));
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(

        backgroundColor: mainColor,
          title: Text("${data.logindata['firstname'].toString().toUpperCase()}"),
          actions: [
            IconButton(
              icon: Icon(
                Icons.delete_outline,
                color: Colors.white,
              ),
              onPressed: () {
                UserDeleteTwo(context);
              },
            )
          ],
          // leading: IconButton(
          //     icon: Icon(Icons.dehaze),
          //     onPressed: () {
          //       if (_scaffoldKey.currentState?.isDrawerOpen == false) {
          //         _scaffoldKey.currentState?.openDrawer();
          //       } else {
          //         _scaffoldKey.currentState?.openEndDrawer();
          //       }
          //     })
      ),

      drawer: DraWer(),

        body: Container(
          // color: Colors.grey,
          width: size.width,
          height: size.height,
          child: Padding(
            padding: EdgeInsets.only(left: 25.0,right: 25.0,top: 50),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CaRd(
                    text: '${data.logindata['firstname']}',
                    ic: Icon(Icons.person,size: 40),
                    tap: (){},
                  ),
                  CaRd(
                    text: '${data.logindata['lastname']}',
                    ic: Icon(Icons.person,size: 40),
                    tap: (){},
                  ),
                  CaRd(
                    text: '${data.logindata['email']}',
                    ic: Icon(Icons.email,size: 40),
                    tap: (){},
                  ),
                  CaRd(
                    text: '${data.logindata['role']}',
                    ic: Icon(Icons.settings_accessibility,size: 40),
                    tap: (){},
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}


UserDeleteTwo(context) {
  /// this popup alert dialog comes with to button verifing yes or no to delete
  var size = MediaQuery.of(context).size;
  var AuthId = Get.put(Controller());
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
              Container(
                height: 100,
                decoration: BoxDecoration(
                    shape: BoxShape.circle
                ),
                child: Lottie.network("https://assets9.lottiefiles.com/packages/lf20_uFo1Km.json",fit: BoxFit.fill),
              ),
              SizedBox(height: 10,),
              const Text(
                "Are you sure you want to\n delete this user?",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: size.width * 0.300,
                    height: size.height * 0.07,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                                width: 2, color: Colors.red.shade900)),
                        primary: Colors.white,
                      ),
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        "No",
                        style: TextStyle(
                            color: Colors.red.shade900,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: size.width * 0.300,
                    height: size.height * 0.07,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        primary: Colors.red.shade900,
                      ),
                      onPressed: () async {
                        Map<String, dynamic> userPassJson() => {
                          "email": AuthId.logindata['email'],
                        };
                        print("this is the delete body ${userPassJson()}");
                        var result= await AuthId.deleteUser(json.encode(userPassJson()));

                        Get.back();
                        DeleteSuccessfullyThree(context);
                      },
                      child: const Text(
                        "Yes",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
            ]),
      );
    },
  );
}

DeleteSuccessfullyThree(context) {
  /// this alert dialog comes after the [UserDeleteTwo()] alert to show user deleted
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
                backgroundColor: mainColor,
                radius: 40.0,
                child: Lottie.network("https://assets9.lottiefiles.com/packages/lf20_uFo1Km.json",fit: BoxFit.fill),
              ),
              SizedBox(height: 20,),
              const Text(
                "Delete Successfully",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10,),
              Container(
                  height: 50,
                  width: 200,
                  child: normalButton(
                    color: mainColor,
                    text: "Back to home",
                    onTap: (){
                      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                    },
                  )
              ),
              SizedBox(height: 20,),
            ]),
      );
    },
  );
}




// class HomePage extends StatefulWidget {
//   @override _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage>
//     with SingleTickerProviderStateMixin {
//   AnimationController _animationController;
//   bool isPlaying = false;
//   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
//   bool _isDrawerOpen = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _animationController =
//         AnimationController(vsync: this, duration: Duration(milliseconds: 300));
//   }
//
//
//
//   @override
//   void dispose() {
//     super.dispose();
//     _animationController.dispose();
//   }
//
//   void _handleOnPressed() {
//     setState(() {
//       isPlaying = !isPlaying;
//       isPlaying
//           ? _animationController.forward()
//           : _animationController.reverse();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       primary: true,
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: Text(
//           "Drawer animation",
//           style: TextStyle(
//               fontSize: 40,
//               fontStyle: FontStyle.italic,
//               fontWeight: FontWeight.w600,
//               color: Colors.black45),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.amber,
//         leading: IconButton(
//           icon: AnimatedIcon(
//               icon: AnimatedIcons.menu_arrow, progress: _animationController),
//           onPressed: () {
//             if (!_isDrawerOpen) {
//               _scaffoldKey.currentState.openDrawer();
//             } else {
//               Navigator.pop(context);
//             }
//             setState(() {
//               _isDrawerOpen = !_isDrawerOpen;
//             });
//             _handleOnPressed();
//           },
//         ),
//       ),
//
//       body: Scaffold(
//         key: _scaffoldKey,
//         drawer: Drawer(
//           child: ListView(
//             children: <Widget>[
//               ListTile(
//                 title: Text("prve"),
//               ),
//             ],
//           ),
//         ),
//
//
//         body: Container(
//           child: CustomButton(),
//         ),
//       ),
//
//     );
//   }
// }
//
