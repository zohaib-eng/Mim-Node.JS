import 'package:flutter/material.dart';

class CaRd extends StatefulWidget {
  final String text;
  final Icon ic;
  final VoidCallback tap;
  const CaRd({
    Key? key, 
    required this.text, required this.ic, required this.tap})
      : super(key: key);

  @override
  State<CaRd> createState() => _CaRdState();
}

class _CaRdState extends State<CaRd> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.tap,
      child: Card(
        elevation: 5,
        child: Container(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              widget.ic,
              Text("${widget.text}",style: TextStyle(fontSize: 20),),
            ],
          ),
        ),
      ),
    );
  }
}
