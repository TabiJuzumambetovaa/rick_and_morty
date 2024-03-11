import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rick_morty/core/features/screens/data/models/charactes_model.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/cubit/character_cubit.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/location/info_location_sreen.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/theme/app_colors.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/theme/app_fonts.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/theme/theme.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/widgets/blur_backgraund_image.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/widgets/info_about_character.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/widgets/info_about_character_widget.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/widgets/info_character_circcle_avatar_image.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/widgets/info_character_nav_pop_icon.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/widgets/status_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class InfoCharacterScreen extends StatefulWidget {
  const InfoCharacterScreen(
      {Key? key, required this.charactersModel, required this.characterIndex})
      : super(key: key);

  final CharactersModel? charactersModel;
  final int characterIndex;

  @override
  State<InfoCharacterScreen> createState() => _InfoCharacterScreenState();
  
}

class _InfoCharacterScreenState extends State<InfoCharacterScreen> {
  @override
  void initState() {
   BlocProvider.of<CharacterCubit>(context).getCharacters();
        setState(() {
          
        });
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
            return const Center(child: CircularProgressIndicator());
          } else if (state is CharacterSuccess) {
            return Stack(
              children: [
                BlurBackGraundImage(
                  characterIndex: widget.characterIndex,
                  image:
                      state.charactersModel?.results?[widget.characterIndex].image ??
                          "",
                          
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 370.h,
                      ),
                      Text(
                        state.charactersModel?.results?[widget.characterIndex].name ??
                            "",
                        style: AppFonts.w400s34
                            .copyWith(color: themeProvider.characterName),
                      ),
                      StatusText(
                        characterIndex: widget.characterIndex,
                        status: state.charactersModel?.results?[widget.characterIndex]
                                .status ??
                            "",
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          InfoAboutCharacter(
                              themeProvider: themeProvider,
                              characterIndex: widget.characterIndex,
                              text: state.charactersModel
                                      ?.results?[widget.characterIndex].gender ??
                                  "",
                              title: "Gender"),
                          SizedBox(
                            width: 120.w,
                          ),
                          InfoAboutCharacter(
                            themeProvider: themeProvider,
                            characterIndex: widget.characterIndex,
                            text: state.charactersModel
                                    ?.results?[widget.characterIndex].species ??
                                "",
                            title: "Species",
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      InfoAboutCharacterWidget(
                          themeProvider: themeProvider,
                          characterIndex: widget.characterIndex,
                          title: "Place of birth",
                          text: state.charactersModel?.results?[widget.characterIndex]
                                  .origin?.name ??
                              "",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>  MyWidget(characterIndex: widget.characterIndex,),
                              ),
                            );
                          }),
                      SizedBox(
                        height: 20.h,
                      ),
                      InfoAboutCharacterWidget(
                          themeProvider: themeProvider,
                          characterIndex: widget.characterIndex,
                          title: "Location",
                          text: state.charactersModel?.results?[widget.characterIndex]
                                  .location?.name ??
                              "",
                          onPressed: () {}),
                      SizedBox(
                        height: 50.h,
                      ),
                      Row(
                        children: [
                          Text(
                            "Эпизоды",
                            style: AppFonts.w500s20
                                .copyWith(color: themeProvider.characterName),
                          ),
                          const Spacer(),
                          Text(
                            "Все эпизоды",
                            style: AppFonts.w400s12
                                .copyWith(color: themeProvider.textColor),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 74.w,
                            height: 74.h,
                            decoration: BoxDecoration(
                                color: AppColors.black,
                                borderRadius: BorderRadius.circular(10.r)),
                            //child:Image
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Column(
                            children: [
                              const Text("episode1"),
                              SizedBox(
                                height: 5.h,
                              ),
                              const Text("name"),
                              SizedBox(
                                height: 5.h,
                              ),
                              const Text("exist"),
                            ],
                          ),
                          const Spacer(),
                          IconButton(
                              onPressed: () {
                                
                              },
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                color: themeProvider.characterName,
                              )),
                        ],
                      )
                    ],
                  ),
                ),
                InfoCharacterCircleAvatarImage(
                  themeProvider: themeProvider,
                  characterIndex: widget.characterIndex,
                  image:
                      state.charactersModel?.results?[widget.characterIndex].image ??
                          "",
                ),
                const InfoCharacterNavPopIcon(),
                const Line(),
              ],
            );
          }
          return const Text("Something went wrong");
        },
      ),
    );
  }
}

class Line extends StatelessWidget {
  const Line({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 180,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: AppColors.lihgtMode.withOpacity(0.70),
        ),
        height: 2.0,
      ),
    );
  }
}
