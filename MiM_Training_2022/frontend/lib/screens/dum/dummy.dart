import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../constant/color.dart';
import '../../constant/loader.dart';

class dummmy extends StatefulWidget {
  const dummmy({Key? key}) : super(key: key);

  @override
  State<dummmy> createState() => _dummmyState();
}

class _dummmyState extends State<dummmy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: white,
          ),
          child: CachedNetworkImage(
            imageUrl: 'https://loremflickr.com/cache/resized/65535_49259934717_84997737b1_n_320_240_g.jpg',
            imageBuilder: (context, imageProvider) => Container(
              width: 80.0,
              height: 80.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: imageProvider, fit: BoxFit.cover),
              ),
            ),
            placeholder: (context, url) => Is_Loading(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
