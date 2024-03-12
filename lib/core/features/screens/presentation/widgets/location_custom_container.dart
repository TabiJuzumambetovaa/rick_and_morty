import 'package:flutter/material.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/screens/location/info_location_sreen.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/theme/app_colors.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/theme/app_fonts.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LocationCustomContainer extends StatelessWidget {
  const LocationCustomContainer({
    super.key,
    required this.themeProvider,
    required this.name,
    required this.dimension, required this.locationIndex,
  });

  final ThemeProvider themeProvider;
  final String name;
  final String dimension;
  final int locationIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> MyWidget(locationIndex: locationIndex)));
        },
        child: Container(
          width: 343.w,
          height: 218.h,
          decoration: BoxDecoration(
            color: themeProvider.themeColor,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.buttonColor, width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 343.w,
                height: 150.h,
                decoration: BoxDecoration(
                  color: AppColors.bg,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                  border: Border.all(color: themeProvider.textFieldColor, width: 1),
                ),
                child: Center(
                  child: Text(
                    "Image",
                    style: AppFonts.w400s34.copyWith(color: AppColors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  name,
                  style:
                      AppFonts.w500s20.copyWith(color: themeProvider.characterName),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "World : $dimension ",
                  style: AppFonts.w400s12.copyWith(color: themeProvider.textColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
