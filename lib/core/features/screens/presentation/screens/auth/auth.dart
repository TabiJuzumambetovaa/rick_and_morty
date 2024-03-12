import 'package:flutter/material.dart';
import 'package:flutter_rick_morty/core/config/app_pngs.dart';
import 'package:flutter_rick_morty/core/consts/app_consts.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/screens/characters/home_page.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/theme/app_colors.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/widgets/alert_dialog_widget.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/widgets/auth_text_field.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/widgets/create_acc_text_button.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/widgets/custom_elevated_button.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/widgets/shared_prefs.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controllerLogin = TextEditingController();
    final TextEditingController controllerPassword = TextEditingController();

    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            AppPngsStart.rickAndMortyLabel,
            width: 267.w,
            height: 376.h,
          ),
          SizedBox(
            height: 50.h,
          ),
          AuthTextField(
            controller: controllerLogin,
            text: 'Логин',
            hintText: 'Логин',
            prefixIcon: const Icon(
              Icons.person,
              color: AppColors.textFieldText,
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          AuthTextField(
            obscureText: true,
            controller: controllerPassword,
            text: 'Пароль',
            hintText: 'Пароль',
            prefixIcon: controllerPassword.text == ""
                ? const Icon(
                    Icons.lock_outline,
                    color: AppColors.textFieldText,
                  )
                : const Icon(Icons.lock_open_sharp),
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomElevatedButton(
  text: "Войти",
  onPressed: () {
    String savedLogin =
        SharedPrefsWidget.prefs.getString(AppConsts.login) ?? "";
    String savedPassword =
        SharedPrefsWidget.prefs.getString(AppConsts.passWord) ?? "";

    if (controllerLogin.text.isEmpty || controllerPassword.text.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const AlertDialogWidget(
            text: "Введите логин и пароль",
          );
        },
      );
    } else if (controllerLogin.text == savedLogin &&
        controllerPassword.text == savedPassword) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const AlertDialogWidget(text: "Неправильный логин или пароль",);
        },
      );
    }
  },
),

          SizedBox(
            height: 30.h,
          ),
          const CreateAccauntTextButton(),
          
        ],
      ),
    );
  }
}
