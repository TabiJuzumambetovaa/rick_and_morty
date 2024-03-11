import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rick_morty/core/config/app_pngs.dart';
import 'package:flutter_rick_morty/core/features/screens/data/models/charactes_model.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/cubit/character_cubit.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/theme/app_fonts.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/theme/theme.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/widgets/character_grid_widget.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/widgets/character_widget.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/widgets/search_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  bool isGrid = false;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharacterCubit>(context).getCharacters();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final TextEditingController controller = TextEditingController();

    return Scaffold(
      backgroundColor: themeProvider.themeColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            children: [
              BlocListener<CharacterCubit, CharacterState>(
                listener: (context, state) {
                  if (state is CharacterSuccess) {}
                },
                child: SearchTextfield(
                  controller: controller,
                  themeProvider: themeProvider,
                  // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
                  hintText: 'Найти персонажа',
                  // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
                  onChanged: (String) {
                    BlocProvider.of<CharacterCubit>(context)
                        .searchCharacters(String);
                  },
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  BlocBuilder<CharacterCubit, CharacterState>(
                    builder: (context, state) {
                      if (state is CharacterSuccess) {
                        final CharactersModel? displayModel =
                            state.searchResult ?? state.charactersModel;
                        return Text(
                          "Всего персонажей: ${displayModel?.results?.length ?? 0}",
                          style: AppFonts.w500s10.copyWith(
                            color: themeProvider.textFieldTextColor,
                          ),
                        );
                      } else {
                        return const Text("Loading...");
                      }
                    },
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isGrid = !isGrid;
                      });
                    },
                    icon: Icon(
                      isGrid ? Icons.list_outlined : Icons.grid_view_outlined,
                      color: themeProvider.textFieldTextColor,
                    ),
                  )
                ],
              ),
              Expanded(
                child: BlocBuilder<CharacterCubit, CharacterState>(
                  builder: (context, state) {
                    if (state is CharacterLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is CharacterSuccess) {
                      final CharactersModel? displayModel =
                          state.searchResult ?? state.charactersModel;
                      if (displayModel?.results?.isEmpty ?? true) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                AppPngsStart.notFound,
                                width: 150.w,
                                height: 251.h,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Text(
                                "Персонажи не найдены",
                                style: AppFonts.w500s10.copyWith(
                                  color: themeProvider.textFieldTextColor,
                                ),
                              ),
                            ],
                          ),
                        );
                      }

                      return isGrid
                          ? GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 8.0,
                                mainAxisSpacing: 8.0,
                              ),
                              itemCount: displayModel?.results?.length ?? 0,
                              itemBuilder: (context, index) {
                                return CharacterGridwidget(
                                  themeProvider: themeProvider,
                                  image:
                                      displayModel?.results?[index].image ?? "",
                                  status:
                                      displayModel?.results?[index].status ??
                                          "",
                                  name:
                                      displayModel?.results?[index].name ?? "",
                                  pol: displayModel?.results?[index].gender ??
                                      "",
                                  characterIndex: index,
                                );
                              },
                            )
                          : ListView.builder(
                              itemCount: displayModel?.results?.length ?? 0,
                              itemBuilder: (context, index) {
                                return CharacterWidget(
                                  characterIndex: index,
                                  themeProvider: themeProvider,
                                  image:
                                      displayModel?.results?[index].image ?? "",
                                  status:
                                      displayModel?.results?[index].status ??
                                          "",
                                  name:
                                      displayModel?.results?[index].name ?? "",
                                  pol: displayModel?.results?[index].gender ??
                                      "",
                                );
                              },
                            );
                    } else if (state is CharacterError) {
                      return Center(
                        child: Column(
                          children: [
                            Image.asset(
                              AppPngsStart.notFound,
                              width: 150.w,
                              height: 251.h,
                            ),
                            Text(
                              "Персонаж с таким именем не найден",
                              style: AppFonts.w500s10.copyWith(
                                color: themeProvider.textFieldTextColor,
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    {
                      return const Text("dont work");
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
