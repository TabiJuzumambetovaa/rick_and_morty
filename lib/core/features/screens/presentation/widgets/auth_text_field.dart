import 'package:flutter/material.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/theme/app_colors.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/theme/app_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.controller,
    required this.text,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
  });
  final TextEditingController controller;
  final String text;
  final String hintText;
  final Icon? prefixIcon;
  final bool obscureText;
  final Icon? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: AppFonts.w400s14.copyWith(color: AppColors.fontColor),
          ),
          SizedBox(
            height: 10.h,
          ),
          TextField(
            
              obscureText: obscureText,
              obscuringCharacter: "*",
              controller: controller,
              style: AppFonts.w400s14.copyWith(color: AppColors.textFieldText),
              decoration: InputDecoration(
                  suffixIcon: suffixIcon,
                  prefixIcon: prefixIcon,
                  hintText: hintText,
                  hintStyle:
                      AppFonts.w400s14.copyWith(color: AppColors.textFieldText),
                  enabledBorder:  UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: AppColors.textFieldColor)),
                  fillColor: AppColors.textFieldColor,
                  filled: true,
                  border: InputBorder.none)),
        ],
      ),
    );
  }
}
