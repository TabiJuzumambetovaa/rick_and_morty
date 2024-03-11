import 'package:flutter/material.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/theme/theme.dart';

class InfoAboutLocationCharacter extends StatelessWidget {
  const InfoAboutLocationCharacter({
    super.key,
    required this.characterIndex,
    required this.themeProvider,
    required this.title,
    required this.text,
    required this.onPressed,
  });

  final int characterIndex;
  final ThemeProvider themeProvider;
  final String title;
  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title),
        Text(text),
        const Spacer(),
        IconButton(
            onPressed: onPressed,
            icon: Icon(
              Icons.arrow_forward_ios,
              color: themeProvider.characterName,
            ))
      ],
    );
  }
}