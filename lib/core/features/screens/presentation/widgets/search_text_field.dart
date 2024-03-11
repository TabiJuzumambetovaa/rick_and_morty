import 'package:flutter/material.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/theme/app_colors.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/theme/app_fonts.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchTextfield extends StatelessWidget {
  const SearchTextfield({
    super.key,
    required this.themeProvider,
    required this.hintText, required this.onChanged, required this.controller,
  });
  final String hintText;

  final ThemeProvider themeProvider;
  final Function(String) onChanged;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      width: 343.w,
      height: 48.h,
      child: TextField(
        style:  AppFonts.w400s16
              .copyWith(color: themeProvider.characterName),
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {
              themeProvider.toggleTheme();
            },
            icon: themeProvider.flashLight,
            color: AppColors.textFieldIconColor,
          ),
          prefixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: AppColors.textFieldIconColor,
              )),
          hintText: hintText,
          hintStyle: AppFonts.w400s16
              .copyWith(color: themeProvider.textFieldTextColor),
          fillColor: themeProvider.textFieldColor,
          filled: true,
          enabledBorder: OutlineInputBorder(
            
              borderSide: BorderSide(
                color: themeProvider.textFieldColor,
              ),
              borderRadius: BorderRadius.circular(100)),
        ),
      ),
    );
  }
}
