import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rick_morty/core/config/app_pngs.dart';
import 'package:flutter_rick_morty/core/features/screens/data/models/location_model.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/cubit/character_cubit.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/theme/app_fonts.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/theme/theme.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/widgets/location_custom_container.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/widgets/search_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<CharacterCubit>(context).getLocation();
    setState(() {});
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchTextfield(
                controller: controller,
                themeProvider: themeProvider,
                hintText: 'Найти локацию',
                onChanged: (string) {
                  BlocProvider.of<CharacterCubit>(context)
                      .searchLocations(string);
                },
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  BlocBuilder<CharacterCubit, CharacterState>(
                    builder: (context, state) {
                      if (state is CharacterSuccess) {
                        final LocationModel? displayModel =
                            state.searchResultLocation ?? state.locationModel;
                        return Text(
                          "Всего локаций: ${displayModel?.results?.length ?? 0}",
                          style: AppFonts.w500s10.copyWith(
                            color: themeProvider.textFieldTextColor,
                          ),
                        );
                      } else {
                        return const Text("Loading...");
                      }
                    },
                  ),
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
                      final LocationModel? displayModel =
                          state.searchResultLocation ?? state.locationModel;
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
                                "Локации не найдены",
                                style: AppFonts.w500s10.copyWith(
                                  color: themeProvider.textFieldTextColor,
                                ),
                              ),
                            ],
                          ),
                        );
                      }

                      return ListView.builder(
                        
                        itemCount: displayModel?.results?.length ?? 0,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: LocationCustomContainer(
                              locationIndex: index,
                              themeProvider: themeProvider,
                              name: displayModel?.results?[index].name ?? "",
                              dimension: displayModel?.results?[index].dimension ?? "",
                            ),
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
                              "Локация с таким названием не найдена",
                              style: AppFonts.w500s10.copyWith(
                                color: themeProvider.textFieldTextColor,
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return const Text("dont work");
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
