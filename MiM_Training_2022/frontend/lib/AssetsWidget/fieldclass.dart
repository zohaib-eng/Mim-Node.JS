import 'package:flutter/material.dart';

import '../constant/color.dart';

class ConstField extends StatefulWidget {
  final String error;
  final String hint;
  final FocusNode focus;
  final FocusNode Nextfocus;
  TextEditingController controller = TextEditingController();


  ConstField({
    Key? key,
    required this.focus,
    required this.controller,
    required this.error,
    required this.hint,
    required this.Nextfocus,


  }) : super(key: key);

  @override
  State<ConstField> createState() => _ConstFieldState();
}

class _ConstFieldState extends State<ConstField> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Container(
      margin: EdgeInsets.only(
          left: size.width * 0.08,
          right: size.width * 0.08,
          top: size.width * 0.008,
          bottom: size.width * 0.08),
      height: size.width * 0.08,
      // color: Colors.blue,
      child: TextFormField(
        autofocus: true,
        focusNode: widget.focus,
        controller: widget.controller,
        validator: (value) {
          if (value!.isNotEmpty) {
            return null;
          } else {
            return "${widget.error}";
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
          hintText: "${widget.hint}",
          hintStyle: TextStyle(color: Colors.black.withOpacity(0.25)),
          border: InputBorder.none,
          fillColor: Colors.white,
          filled: true,
        ),
        onFieldSubmitted: (term) {
          widget.focus.unfocus();
          FocusScope.of(context).requestFocus(widget.Nextfocus);
        },
      ),
    );
  }
}
