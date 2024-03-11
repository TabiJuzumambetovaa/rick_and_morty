import 'package:flutter/material.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/theme/app_fonts.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/theme/theme.dart';

class InfoAboutCharacter extends StatelessWidget {
  const InfoAboutCharacter({
    super.key,
    required this.themeProvider,
    required this.characterIndex,
    required this.text,
    required this.title,
  });

  final ThemeProvider themeProvider;
  final int characterIndex;
  final String text;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: AppFonts.w400s12.copyWith(color: themeProvider.textColor),
        ),
        Text(
          text,
          style: AppFonts.w400s14.copyWith(color: themeProvider.characterName),
        ),
      ],
    );
  }
}