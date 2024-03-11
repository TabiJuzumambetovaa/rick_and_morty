
import 'package:flutter/material.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/theme/app_colors.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/theme/app_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AlertDialogWidget extends StatelessWidget {
  const AlertDialogWidget({
    super.key, required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 319.w,
      height: 188.h,
      child: AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: const Text(
          "Ошибка",
          style: AppFonts.w500s20,
        ),
        content:  Text(
          text,
          style: AppFonts.w400s14,
        ),
        actions: [
          Center(
            child: SizedBox(
                width: 259.w,
                height: 40.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),
                    side: const BorderSide(color: AppColors.okButtonColor,width: 1))
                  ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Ок",
                      style: AppFonts.w400s16.copyWith(
                          color: AppColors.okButtonColor),
                    )),
                    
              ),
          ),
            SizedBox(height: 25.h,)
        ],
      ),
    );
  }
}
