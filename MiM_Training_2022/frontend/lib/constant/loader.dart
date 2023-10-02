import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Is_Loading extends StatefulWidget {
  const Is_Loading({Key? key}) : super(key: key);

  @override
  State<Is_Loading> createState() => _Is_LoadingState();
}

class _Is_LoadingState extends State<Is_Loading> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SizedBox(
        height: size.height/1.5,
        child: Center(
            child: Lottie.asset("assets/animations/anime.json",height: 200,width: 200)));
  }
}


class noData extends StatefulWidget {
  const noData({Key? key}) : super(key: key);

  @override
  State<noData> createState() => _noDataState();
}

class _noDataState extends State<noData> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
        height: size.height/2,
        child: Center(
            child: Lottie.asset("assets/animation/records.json")));
  }
}
