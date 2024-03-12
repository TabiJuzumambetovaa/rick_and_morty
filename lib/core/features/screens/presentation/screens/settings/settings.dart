import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_rick_morty/core/consts/app_consts.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/screens/settings/edit_screen.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/theme/app_colors.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/theme/app_fonts.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/theme/theme.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/widgets/shared_prefs.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/widgets/theme_change_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: themeProvider.themeColor,
      appBar: AppBar(
        elevation: 0,
        leading: Icon(
          Icons.arrow_back,
          color: themeProvider.characterName,
        ),
        title: Text(
          "Настройки",
          style: AppFonts.w500s20.copyWith(color: themeProvider.characterName),
        ),
        backgroundColor: themeProvider.themeColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EditWidget(themeProvider: themeProvider),
            SizedBox(
              height: 20.h,
            ),
            EditButton(themeProvider: themeProvider),
            SizedBox(
              height: 17.h,
            ),
            const Linetwo(),
            SizedBox(
              height: 17.h,
            ),
            Text(
              "Внешний вид",
              style: AppFonts.w500s10.copyWith(color: themeProvider.textColor),
            ),
            SizedBox(
              height: 15.h,
            ),
            ThemeChangeWidget(themeProvider: themeProvider, title:  "Темная тема", tetx: 'Вкючена',),
            SizedBox(
              height: 30.h,
            ),
           const Linetwo(),
            SizedBox(
              height: 17.h,
            ),
            Text(
              "О приложении",
              style: AppFonts.w500s10.copyWith(color: themeProvider.textColor),
            ),
            SizedBox(
              height: 14.h,
            ),
            Text(
              "Зигерионцы помещают Джерри и Рика в симуляцию, чтобы узнать секрет изготовления концен-трирован- ной темной материи.",
              style:
                  AppFonts.w400s14.copyWith(color: themeProvider.characterName),
            ),
            SizedBox(
              height: 30.h,
            ),
           const Linetwo(),
            SizedBox(
              height: 17.h,
            ),
            Text(
              "Версия приложения",
              style: AppFonts.w500s10.copyWith(color: themeProvider.textColor),
            ),
            Text(
              "Rick & Morty  v1.0.0",
              style:
                  AppFonts.w400s14.copyWith(color: themeProvider.characterName),
            ),
          ],
        ),
      ),
    );
  }
}


class Linetwo extends StatelessWidget {
  const Linetwo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppColors.lihgtMode.withOpacity(0.70),
      ),
      height: 2.0,
    );
  }
}

class EditButton extends StatelessWidget {
  const EditButton({
    super.key,
    required this.themeProvider,
  });

  final ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 335.w,
      height: 40.h,
      child: ElevatedButton(
        onPressed: () {
          
          
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const EditScreen()));
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1.w, color: AppColors.buttonColor),
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: themeProvider.themeColor,
        ),
        child: Text(
          "Редактировать",
          style:
              AppFonts.w400s16.copyWith(color: AppColors.buttonColor),
        ),
      ),
    );
  }
}

class EditWidget extends StatelessWidget {
  const EditWidget({
    super.key,
    required this.themeProvider, this.image,

  });
  final File? image;

  final ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 40.r,
          backgroundImage: image != null ? FileImage(image!) : null,
          
        ),
        SizedBox(
          width: 30.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
             "${SharedPrefsWidget.prefs.getString(AppConsts.name) ?? ""} ${SharedPrefsWidget.prefs.getString(AppConsts.lastName) ?? ""}",
              style: AppFonts.w400s16
                  .copyWith(color: themeProvider.characterName),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              SharedPrefsWidget.prefs.getString(AppConsts.login) ?? "",
              style: AppFonts.w400s14
                  .copyWith(color: themeProvider.textColor),
            )
          ],
        ),
      ],
    );
  }
}
