import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoCharacterCircleAvatarImage extends StatelessWidget {
  const InfoCharacterCircleAvatarImage({
    super.key,
    required this.themeProvider,
    required this.characterIndex, required this.image,
  });

  final ThemeProvider themeProvider;
  final int characterIndex;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height / 4.5,
      left: MediaQuery.of(context).size.width / 4,
      child: CircleAvatar(
        backgroundColor: themeProvider.themeColor,
        radius: 90.r,
        child: ClipOval(
          child: CachedNetworkImage(
            width: 146.w,
            height: 146.h,
            fit: BoxFit.cover,
        imageUrl: image,
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
     ),
          // child: Image.network(
          //   image,
          //   width: 146.0.w,
          //   height: 146.0.h,
          //   fit: BoxFit.cover,
          // ),
        ),
      ),
    );
  }
}