import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rick_morty/core/features/screens/data/models/location_model.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/cubit/character_cubit.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/theme/app_colors.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/theme/app_fonts.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/theme/theme.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/widgets/character_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key, this.locationModel, required this.locationIndex})
      : super(key: key);
  final LocationModel? locationModel;
  final int locationIndex;

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  void initState() {
    BlocProvider.of<CharacterCubit>(context).getLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: themeProvider.themeColor,
      body: BlocBuilder<CharacterCubit, CharacterState>(
        builder: (context, state) {
          if (state is CharacterLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CharacterSuccess) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 280.h,
                      color: AppColors.bg,
                      child: const Text("Image"),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Text(
                      state.locationModel?.results?[widget.locationIndex].name ??
                          "",
                      style: AppFonts.w700s34
                          .copyWith(color: themeProvider.characterName),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Text(
                      "Мир:${state.locationModel?.results?[widget.locationIndex].dimension ?? ''}",
                      style: AppFonts.w400s12
                          .copyWith(color: themeProvider.textColor),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Text(
                      "Персонажи",
                      style: AppFonts.w500s20
                          .copyWith(color: themeProvider.characterName),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state
                                .locationModel
                                ?.results?[widget.locationIndex]
                                .residents
                                ?.length ??
                            0,
                        itemBuilder: (context, index) {
                          final locationResidents = state.locationModel
                              ?.results?[widget.locationIndex].residents;
                         

                          final characterIndex = state.charactersModel?.results
                              ?.indexWhere((character) =>
                                  locationResidents?[index] == character.url);
                         

                          if (characterIndex != null && characterIndex >= 0) {
                            return CharacterWidget(
                              themeProvider: themeProvider,
                              image:
                                  state.charactersModel?.results?[characterIndex]
                                          .image ??
                                      "",
                              status:
                                  state.charactersModel?.results?[characterIndex]
                                          .status ??
                                      "",
                              name:
                                  state.charactersModel?.results?[characterIndex]
                                          .name ??
                                      '',
                              pol:
                                  state.charactersModel?.results?[characterIndex]
                                          .gender ??
                                      '',
                              characterIndex: characterIndex,
                            );
                          }

                          return const SizedBox();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
