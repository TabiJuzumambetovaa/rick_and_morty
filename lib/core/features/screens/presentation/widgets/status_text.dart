import 'package:flutter/material.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/theme/app_colors.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/theme/app_fonts.dart';

class StatusText extends StatelessWidget {
  const StatusText({
    super.key,
    required this.characterIndex,
    required this.status,
  });

  final int characterIndex;
  final String status;

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
    return Text(
      status,
      style: AppFonts.w500s20.copyWith(color: statusColor),
    );
  }
}
