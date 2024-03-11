import 'package:flutter/material.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/theme/app_fonts.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/theme/theme.dart';

class InfoAboutCharacterWidget extends StatelessWidget {
  const InfoAboutCharacterWidget({
    super.key,
    required this.themeProvider,
    required this.characterIndex,
    required this.title,
    required this.text,
    required this.onPressed,
  });

  final ThemeProvider themeProvider;
  final int characterIndex;
  final String title;
  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppFonts.w400s12.copyWith(color: themeProvider.textColor),
            ),
            Text(
              text,
              style:
                  AppFonts.w400s14.copyWith(color: themeProvider.characterName),
            ),
          ],
        ),
        const Spacer(),
        IconButton(
            onPressed: onPressed,
            icon: Icon(
              Icons.arrow_forward_ios,
              color: themeProvider.characterName,
            )),
      ],
    );
  }
}
