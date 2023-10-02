import 'package:flutter/material.dart';

import 'color.dart';

class AuthButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  final Color color;

  const AuthButton({
    Key? key,
    required this.text,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  _AuthButtonState createState() => _AuthButtonState();
}

class _AuthButtonState extends State<AuthButton> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Container(

          height: size.height * 0.06,
          width: size.width * 0.8,
          // height: size.height * 0.075,
          // width: size.width * 0.9,
          decoration: BoxDecoration(
              color: widget.color,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
              borderRadius:
              new BorderRadius.all(Radius.circular(8))),
          child: Center(
            child: Text(
              widget.text,
              style: TextStyle(
                fontSize: size.width * 0.045,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}


/// normal AUth Button

class NormalAuthButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  final Color color;

  const NormalAuthButton({
    Key? key,
    required this.text,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  NormalAuthButtonState createState() => NormalAuthButtonState();
}

class NormalAuthButtonState extends State<NormalAuthButton> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Container(

          height: size.height * 0.06,
          width: size.width * 0.49,
          // height: size.height * 0.075,
          // width: size.width * 0.9,
          decoration: BoxDecoration(
              color: widget.color,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
              borderRadius:
              new BorderRadius.all(Radius.circular(8))),
          child: Center(
            child: Text(
              widget.text,
              style: TextStyle(
                fontSize: size.width * 0.045,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Auth outline button here


class outAuthButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  final Color color;

  const outAuthButton({
    Key? key,
    required this.text,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  outAuthButtonState createState() => outAuthButtonState();
}

class outAuthButtonState extends State<outAuthButton> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0,left: 10,right: 10),
        child: Container(
          height: size.height * 0.06,
          width: size.width * 0.33,
          // height: size.height * 0.075,
          // width: size.width * 0.9,
          decoration: BoxDecoration(
            // color: widget.color,
              border: Border.all(
                  color: widget.color
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
              borderRadius:
              new BorderRadius.all(Radius.circular(8))),
          child: Center(
            child: Text(
              widget.text,
              style: TextStyle(
                fontSize: size.width * 0.045,
                color: widget.color,
              ),
            ),
          ),
        ),
      ),
    );
  }
}


/// social button here
class SocialButton extends StatefulWidget {
  final String url;
  final Color color;
  final VoidCallback onTap;

  const SocialButton({
    Key? key,
    required this.url,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  _SocialButtonState createState() => _SocialButtonState();
}

class _SocialButtonState extends State<SocialButton> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(14),
      child: CircleAvatar(
        // maxRadius: size.width * 0.065,
        backgroundColor: widget.color,
        radius: size.width * 0.055,
        backgroundImage:AssetImage(widget.url,),
        // child: Center(child: Image.asset(widget.url,height: 40,)
        // ),
      ),
    );
  }
}


///   pop up button //////
class PopUpButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  final Color color;
  final Color textcolor;

  const PopUpButton({
    Key? key,
    required this.textcolor,
    required this.text,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  PopUpButtonState createState() => PopUpButtonState();
}

class PopUpButtonState extends State<PopUpButton> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Container(
          height: size.height * 0.05,
          width: size.width * 0.25,
          decoration: BoxDecoration(
              color: widget.color,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
              border: Border.all(
                  color: widget.textcolor,
                  width: 1
              ),
              borderRadius:
              new BorderRadius.all(Radius.circular(10))),
          child: Center(
            child: Text(
              widget.text,
              style: TextStyle(
                fontSize: size.width * 0.045,
                color: widget.textcolor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

///   Continue Button ////
class ContinueButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  final Color color;

  const ContinueButton({
    Key? key,
    required this.text,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  ContinueButtonState createState() => ContinueButtonState();
}

class ContinueButtonState extends State<ContinueButton> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              color: widget.color,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
              borderRadius:
              new BorderRadius.all(Radius.circular(100))),
          child: Center(
            child: Icon(Icons.arrow_forward_rounded,color: Colors.white,size: 30,),
          ),
        ),
      ),
    );
  }
}

///   Continue Button ////
class normalButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  final Color color;

  const normalButton({
    Key? key,
    required this.text,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  normalButtonState createState() => normalButtonState();
}

class normalButtonState extends State<normalButton> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0,left: 10,right: 10),
        child: Container(
          height: 40,
          decoration: BoxDecoration(
              color: widget.color,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
              borderRadius:
              new BorderRadius.all(Radius.circular(8))
          ),
          child: Center(
            child: Text(widget.text,style: TextStyle(
                color: Colors.white,
                fontSize: size.width * 0.01,
                fontWeight: FontWeight.w600
            ),),
          ),
        ),
      ),
    );
  }
}


/// pop up button /////


class popupnormalButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  final Color color;

  const popupnormalButton({
    Key? key,
    required this.text,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  popupnormalButtonState createState() => popupnormalButtonState();
}

class popupnormalButtonState extends State<popupnormalButton> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0,left: 10,right: 10),
        child: Container(
          height: 40,
          width: 100,
          decoration: BoxDecoration(
              color: widget.color,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
              borderRadius:
              new BorderRadius.all(Radius.circular(8))
          ),
          child: Center(
            child: Text(widget.text,style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold
            ),),
          ),
        ),
      ),
    );
  }
}

///   outline button

class popupnormaloutlineButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  final Color color;

  const popupnormaloutlineButton({
    Key? key,
    required this.text,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  popupnormaloutlineButtonState createState() =>popupnormaloutlineButtonState();
}

class popupnormaloutlineButtonState extends State<popupnormaloutlineButton> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0,left: 10,right: 10),
        child: Container(
          height: 40,
          width: 100,
          decoration: BoxDecoration(
            // color: widget.color,
              border: Border.all(
                  color: mainColor
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
              borderRadius:
              new BorderRadius.all(Radius.circular(8))
          ),
          child: Center(
            child: Text(widget.text,style: TextStyle(
                color:mainColor,
                fontSize: 16,
                fontWeight: FontWeight.bold
            ),),
          ),
        ),
      ),
    );
  }
}

/// pop up button /////

class popupextendedButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  final Color color;

  const popupextendedButton({
    Key? key,
    required this.text,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  popupextendedButtonState createState() => popupextendedButtonState();
}

class popupextendedButtonState extends State<popupextendedButton> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0,left: 10,right: 10),
        child: Container(
          height: 40,
          width: 130,
          decoration: BoxDecoration(
              color: widget.color,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
              borderRadius:
              new BorderRadius.all(Radius.circular(8))
          ),
          child: Center(
            child: Text(widget.text,style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold
            ),),
          ),
        ),
      ),
    );
  }
}