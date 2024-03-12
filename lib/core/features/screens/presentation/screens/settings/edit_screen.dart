import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/theme/app_colors.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/theme/app_fonts.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/theme/theme.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/widgets/theme_change_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({super.key, this.image});
   final File? image;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    File? image; 

    Future<void> getImageFromGallery() async {
      final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        image = File(pickedFile.path);
      }
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Icon(
          Icons.arrow_back,
          color: themeProvider.characterName,
        ),
        title: Text(
          "Редактировать профиль",
          style: AppFonts.w500s20.copyWith(color: themeProvider.characterName),
        ),
        backgroundColor: themeProvider.themeColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 75.r,
              backgroundImage: image != null ? FileImage(image!) : null,
            ),
            SizedBox(
              height: 10.h,
            ),
            TextButton(
              onPressed: () async {
                await getImageFromGallery();
              },
              child: Text(
                "Изменить фото",
                style: AppFonts.w400s16.copyWith(color: AppColors.buttonColor),
              ),
            ),
            SizedBox(height: 16.h,),
            Text(
              "Профиль",
              style: AppFonts.w500s10.copyWith(color: themeProvider.textColor),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 16.h,),
            ThemeChangeWidget(
              themeProvider: themeProvider,
              title: "Изменить ФИО",
              tetx: "Oleg Belotserkovsky",
            ),
            SizedBox(height: 26.h,),
            ThemeChangeWidget(
              themeProvider: themeProvider,
              title: "Логин",
              tetx: "Rick",
            ),
          ],
        ),
      ),
    );
  }
}
