import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rick_morty/core/features/screens/data/repositories/characters_reopitory.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/cubit/character_cubit.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/screens/start_screens/start_screen.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/theme/theme.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/widgets/shared_prefs.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: SharedPrefsWidget(
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => ThemeProvider()),
            RepositoryProvider(create: (_) => CharacterRepository()),
            BlocProvider(
              create: (context) => CharacterCubit(
                repository: RepositoryProvider.of<CharacterRepository>(context),
              ),
            ),
          ],
          child: const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: StartScreen(),
          ),
        ),
      ),
    );
  }
}
