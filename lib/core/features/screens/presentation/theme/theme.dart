import 'package:flutter/material.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/theme/app_colors.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = false;
  final Color _lightThemeColor = Colors.white; 
  final Color _darkThemeColor = AppColors.darkModeBg;
  final Color _darkThemeNavBarColor = AppColors.darkMode;
  final Color _lightThemeNavBarColor = AppColors.lightTextField;
  final Color _dartkModeTextColor=AppColors.dartTextColor;
  final Color _lightModeTextColor=AppColors.lightModeTextColor; 
  final Icon _flashLightOn=const Icon(Icons.flashlight_on_outlined);
  final Icon _flashLightOff=const Icon(Icons.flashlight_off_outlined);
  final Color _characterNameDark = AppColors.white;
  final Color _characterNameLight = AppColors.black;
  final Color _darkTextNavbar = AppColors.textButtonColor;
  final Color _lightTextNavBar = AppColors.buttonColor;
  final Color _lightMode=AppColors.lihgtMode;
  


  
 
 

  bool get isDarkMode => _isDarkMode;
  Color get themeColor => _isDarkMode ? _darkThemeColor : _lightThemeColor;
  Color get navBarColor => _isDarkMode ? _darkThemeNavBarColor : _lightThemeColor;
  Color get textFieldColor => _isDarkMode ? _darkThemeNavBarColor : _lightThemeNavBarColor;
  Color get textFieldTextColor=>_isDarkMode ? _dartkModeTextColor : _lightModeTextColor;
  Icon get flashLight=>_isDarkMode ? _flashLightOff : _flashLightOn;
  Color get characterName=>_isDarkMode ? _characterNameDark : _characterNameLight;
  Color get textNavBar=>_isDarkMode ? _darkTextNavbar : _lightTextNavBar;
  Color get textColor=>_isDarkMode ? _dartkModeTextColor : _lightMode;







  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}
