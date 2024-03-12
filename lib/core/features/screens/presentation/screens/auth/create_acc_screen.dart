import 'package:flutter/material.dart';
import 'package:flutter_rick_morty/core/consts/app_consts.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/theme/app_colors.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/theme/app_fonts.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/widgets/alert_dialog_widget.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/widgets/auth_text_field.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/widgets/custom_elevated_button.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/widgets/shared_prefs.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateAccScreen extends StatelessWidget {
  const CreateAccScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controllerName = TextEditingController();
    final TextEditingController controllerLastName = TextEditingController();
    final TextEditingController controllerMiddleName = TextEditingController();
    final TextEditingController controllerLogin = TextEditingController();

    final TextEditingController controllerPassword = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Text(
              "Создать аккаунт",
              style: AppFonts.w700s34.copyWith(
                color: AppColors.black,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          AuthTextField(
              controller: controllerName, text: 'Имя', hintText: "Имя"),
          SizedBox(
            height: 15.h,
          ),
          AuthTextField(
              controller: controllerLastName,
              text: 'Фамилия',
              hintText: "Фамилия"),
          SizedBox(
            height: 15.h,
          ),
          AuthTextField(
              controller: controllerMiddleName,
              text: 'Отчество',
              hintText: "Отчество"),
          SizedBox(
            height: 40.h,
          ),
          Container(
            width: 319.w,
            height: 2.h,
            color: AppColors.lineColor,
          ),
          SizedBox(
            height: 40.h,
          ),
          AuthTextField(
            controller: controllerLogin,
            text: 'Логин',
            hintText: 'Логин',
          ),
          SizedBox(
            height: 15.h,
          ),
          AuthTextField(
              obscureText: true,
              controller: controllerPassword,
              text: 'Пароль',
              hintText: 'Пароль',
              prefixIcon: const Icon(
                Icons.lock_outline,
                color: AppColors.textFieldText,
              )),
          SizedBox(
            height: 50.h,
          ),
          CustomElevatedButton(
              text: "Создать",
              onPressed: () async {
                final SharedPreferences pref = SharedPrefsWidget.prefs;
                if (controllerName.text.isEmpty ||
                    controllerLastName.text.isEmpty ||
                    controllerMiddleName.text.isEmpty ||
                    controllerLogin.text.isEmpty ||
                    controllerPassword.text.isEmpty) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const AlertDialogWidget(
                        text: "Все поля должны быть запонены",
                      );
                    },
                  );

                  return;
                }

                await pref.setString(AppConsts.name, controllerName.text);
                await pref.setString(
                    AppConsts.lastName, controllerLastName.text);
                await pref.setString(
                    AppConsts.middleName, controllerMiddleName.text);
                await pref.setString(AppConsts.login, controllerLogin.text);
                await pref.setString(
                    AppConsts.passWord, controllerPassword.text);
                // ignore: use_build_context_synchronously
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}
