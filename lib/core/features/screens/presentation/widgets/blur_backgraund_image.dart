import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlurBackGraundImage extends StatelessWidget {
  const BlurBackGraundImage({
    super.key,
    required this.characterIndex,
    required this.image,
  });

  final int characterIndex;
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 280.h,
        child: ImageFiltered(
          imageFilter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
          child: Image.network(
            image,
            fit: BoxFit.cover,
          ),
        ));
  }
}