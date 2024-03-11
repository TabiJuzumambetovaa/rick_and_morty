import 'package:flutter/material.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoCharacterNavPopIcon extends StatelessWidget {
  const InfoCharacterNavPopIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 100,
      child: SizedBox(
        width: 30.w,
        height: 30.h,
       
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.white,
            size: 24,
          ),
        ),
      ),
    );
  }
}
