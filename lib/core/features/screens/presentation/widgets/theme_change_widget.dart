import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/theme/app_fonts.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThemeChangeWidget extends StatelessWidget {
  const ThemeChangeWidget({
    super.key,
    required this.themeProvider, required this.title, required this.tetx,
  });

  final ThemeProvider themeProvider;
 final String title;
 final String tetx;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          CupertinoIcons.paintbrush,color: themeProvider.characterName,
          weight: 26.w,
        ),
        SizedBox(
          width: 20.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
             title,
              style: AppFonts.w400s16
                  .copyWith(color: themeProvider.characterName),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              tetx,
              style: AppFonts.w400s14
                  .copyWith(color: themeProvider.textColor),
            ),
          ],
        ),
        const Spacer(),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_forward_ios,
              color: themeProvider.characterName,
            )),
      ],
    );
  }
}
