import 'package:flutter/material.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/theme/app_colors.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/theme/app_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
  });
  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 319.w,
      height: 48.h,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.buttonColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          onPressed: onPressed,
          child: Text(
            text,
            style: AppFonts.w400s16.copyWith(color: AppColors.white),
          )),
    );
  }
}