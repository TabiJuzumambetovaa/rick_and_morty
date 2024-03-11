import 'package:flutter/material.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/characters/info_character_screen.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/theme/app_colors.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/theme/app_fonts.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CharacterWidget extends StatelessWidget {
  const CharacterWidget({
    super.key,
    required this.themeProvider,
    required this.image,
    required this.status,
    required this.name,
    required this.pol,
    required this.characterIndex, 
  });

  final ThemeProvider themeProvider;
  final String image;
  final String status;
  final String name;
  final String pol;
  final int characterIndex; 
  @override
  Widget build(BuildContext context) {
    Color statusColor = Colors.black; 
    if (status == 'Alive') {
      statusColor = AppColors.statusAlive;
    } else if (status == 'Dead') {
      statusColor = AppColors.statusDead;
    } else if (status == 'unknown') {
      statusColor = Colors.grey;
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: InkWell(
        onTap: () {
         

          Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => InfoCharacterScreen(
          charactersModel: null,
          characterIndex: characterIndex,
        ),
      ),
    );
        },
        child: Row(
          children: [
            ClipOval(
              child: Image.network(
                image,
                width: 74.0.w,
                height: 74.0.h,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  status,
                  style: AppFonts.w500s10.copyWith(color: statusColor),
                ),
                SizedBox(height: 5.h,),
                Text(
                  name,
                  style: AppFonts.w500s16.copyWith(color: themeProvider.characterName),
                ),
                SizedBox(height: 5.h,),
                Text(
                  pol,
                  style: AppFonts.w400s12.copyWith(color: AppColors.textFieldIconColor),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
