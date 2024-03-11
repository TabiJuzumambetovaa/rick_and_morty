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

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key, this.locationModel, required this.characterIndex})
      : super(key: key);
  final LocationModel? locationModel;
  final int characterIndex;

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
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: double.infinity,
                    height: 270.h,
                    decoration: const BoxDecoration(
                      color: AppColors.buttonColor,
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    state.locationModel?.results?[characterIndex].name ?? "",
                    style: AppFonts.w700s34
                        .copyWith(color: themeProvider.characterName),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "World : ${state.locationModel?.results?[characterIndex].dimension ?? ""} ",
                    style: AppFonts.w400s12
                        .copyWith(color: themeProvider.textColor),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Characters",
                    style: AppFonts.w500s20
                        .copyWith(color: themeProvider.characterName),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.black,
                    )),
                Expanded(
                  child: ListView.builder(
                      itemCount: state.charactersModel?.results?.length ?? 0,
                      itemBuilder: (context, index) {
                        return CharacterWidget(
                            themeProvider: themeProvider,
                            image: state.charactersModel?.results?[characterIndex]
                                    .image ??
                                "",
                            status: state.charactersModel
                                    ?.results?[characterIndex].status ??
                                "",
                            name: state.charactersModel?.results?[characterIndex]
                                    .name ??
                                "",
                            pol: state.charactersModel?.results?[characterIndex]
                                    .gender ??
                                "",
                            characterIndex: characterIndex);
                      }),
                )
              ],
            );
          }
          return const SizedBox();
        }));
  }
}
