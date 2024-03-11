import 'package:flutter/material.dart';
import 'package:flutter_rick_morty/core/config/app_pngs.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/auth/auth.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen>
    with TickerProviderStateMixin {
  late AnimationController _rickController;
  late AnimationController _mortyController;
  late AnimationController _rickAndMortyLabelController;
  late AnimationController _rickAndMortyController;

  late Animation<Offset> _rickAnimation;
  late Animation<Offset> _mortyAnimation;
  late Animation<double> _opacityAnimation;

  late bool _isImagesVisible;
  double _imageOpacity = 1.0;

  @override
  void initState() {
    super.initState();
    _rickAndMortyController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    Future.delayed(const Duration(seconds: 7), () {
      // Изменяем прозрачность изображения
      setState(() {
        _imageOpacity = 0.0;
      });
    });

    _rickController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _mortyController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _rickAndMortyLabelController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _rickAnimation = Tween<Offset>(
      begin: const Offset(0, -2),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _rickAndMortyLabelController,
      curve: Curves.easeInOut,
    ));

    _mortyAnimation = Tween<Offset>(
      begin: const Offset(0, -2),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _rickAndMortyLabelController,
      curve: Curves.easeInOut,
    ));
    _opacityAnimation = Tween<double>(
      begin: 0.0, // Начальная прозрачность
      end: 1.0, // Конечная прозрачность
    ).animate(_rickAndMortyController);

    _isImagesVisible = true;

    Future.delayed(const Duration(seconds: 1), () {
      _rickController.forward();
      _mortyController.forward();

      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          _isImagesVisible = false;
        });
        _rickController.reverse();
        _mortyController.reverse();
        Future.delayed(const Duration(seconds: 2), () {
          // Запускаем анимацию для rickAndMortyLabel
          _rickAndMortyLabelController.forward();
        });
        Future.delayed(const Duration(seconds: 7), () {
          // Запускаем анимацию для rickAndMortyLabel
          _rickAndMortyController.forward();
        });
      });
    });
    Future.delayed(const Duration(seconds: 15), () {
            // Завершена анимация rickAndMortyLabel и rickAndMorty
            // Выполнение перехода на другой экран
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Auth()), // Замените на свой следующий экран
            );
          });
  }
  

  @override
  void dispose() {
    _rickController.dispose();
    _mortyController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Center(
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: AnimatedBuilder(
                animation: _opacityAnimation,
                builder: (context, child) {
                  return Opacity(
                    opacity: _opacityAnimation.value,
                    child: Image.asset(
                      AppPngsStart
                          .rickAndMorty, // Замените на свой URL изображения
                      width: 421.w,
            
                      height: 327.h,
                    ),
                  );
                },
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SlideTransition(
                  position: _rickAnimation,
                  child: AnimatedOpacity(
                    opacity: _isImagesVisible ? 0.0 : 1.0,
                    duration: const Duration(seconds: 3),
                    child: Image.asset(
                      AppPngsStart.rickAndMortyLabel,
                      width: 270.w,
                      height: 379.h,
                    ),
                  ),
                ),
                SlideTransition(
                  position: _rickAnimation,
                  child: AnimatedOpacity(
                    opacity: _imageOpacity,
                    duration: const Duration(
                        seconds: 3), // Установите нужную продолжительность
                    child: Image.asset(
                      AppPngsStart.rick, // Замените на ваш URL изображения
                      width: 310.w,
                      height: 205.h,
                    ),
                  ),
                ),
                
                SlideTransition(
                  position: _mortyAnimation,
                  child: AnimatedOpacity(
                    opacity: _imageOpacity,
                    duration: const Duration(
                        seconds: 3), // Установите нужную продолжительность
                    child: Image.asset(
                      AppPngsStart.morty, // Замените на ваш URL изображения
                      width: 314.w,
                      height: 217.h,
                    ),
                  ),
                ),
                
              ],
            ),
          ],
        ),
      ),
    );
  }
}
