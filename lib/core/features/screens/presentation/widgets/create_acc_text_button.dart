import 'package:flutter/material.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/screens/auth/create_acc_screen.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/theme/app_colors.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/theme/app_fonts.dart';

class CreateAccauntTextButton extends StatelessWidget {
  const CreateAccauntTextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "У вас еще нет аккаунта?",
          style:
              AppFonts.w400s14.copyWith(color: AppColors.textFieldText),
        ),
        TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const CreateAccScreen()));
            },
            child: Text(
              "Создать ",
              style: AppFonts.w400s14
                  .copyWith(color: AppColors.textButtonColor),
            ))
      ],
    );
  }
}