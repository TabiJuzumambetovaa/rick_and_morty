import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rick_morty/core/features/screens/data/repositories/characters_reopitory.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/screens/characters/characters_screen.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/cubit/character_cubit.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/screens/location/location_screen.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/screens/settings/settings.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/theme/app_colors.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/theme/app_fonts.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/theme/theme.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    PersistentTabController controller;

    controller = PersistentTabController(initialIndex: 3);
    List<Widget> screens = [
       BlocProvider(
                          create: (context) => CharacterCubit(repository:RepositoryProvider.of<CharacterRepository>(context) ),
                          child: const CharactersScreen(),
                        ),
       BlocProvider(
                          create: (context) => CharacterCubit(repository:RepositoryProvider.of<CharacterRepository>(context) ),
                          child: const LocationScreen(),
                        ),
      const Scaffold(
        body: Center(
          child: Text(
            "Эпизоды ",
            style: AppFonts.w700s34,
          ),
        ),
      ),
       BlocProvider(
                          create: (context) => CharacterCubit(repository:RepositoryProvider.of<CharacterRepository>(context) ),
                          child: const SettingsScreen(),
                        ),
     
      
    ];

    return PersistentTabView(
      context,
      controller: controller,
      screens: screens,
      items: _navBarsItems(),
      
      confineInSafeArea: true,
      backgroundColor: themeProvider.navBarColor , // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.simple, // Choose the nav bar style with this property.
    );
  }

  

  List<PersistentBottomNavBarItem> _navBarsItems() {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return [
      PersistentBottomNavBarItem(
        textStyle: AppFonts.w400s16,
        icon: const Icon(Icons.person_outline_rounded),
        title: ("Персонажи"),
        activeColorPrimary: themeProvider.textNavBar,
        inactiveColorPrimary: AppColors.dartTextColor,
      ),
      PersistentBottomNavBarItem(
        textStyle: AppFonts.w400s16,
        icon: const Icon(Icons.location_on_outlined),
        title: ("Локации"),
        activeColorPrimary:  themeProvider.textNavBar,
        inactiveColorPrimary: AppColors.dartTextColor,
      ),
      PersistentBottomNavBarItem(
        textStyle: AppFonts.w400s16,
        icon: const Icon(Icons.tv_outlined),
        title: ("Эпизоды"),
        activeColorPrimary:  themeProvider.textNavBar,
        inactiveColorPrimary: AppColors.dartTextColor,
      ),
      PersistentBottomNavBarItem(
        textStyle: AppFonts.w400s16,
        icon: const Icon(Icons.settings_outlined),
        title: ("Настройки"),
        activeColorPrimary:  themeProvider.textNavBar,
        inactiveColorPrimary: AppColors.dartTextColor,
      ),
     
    ];
  }
}
