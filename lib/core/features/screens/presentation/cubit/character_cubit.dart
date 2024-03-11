import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rick_morty/core/features/screens/data/models/charactes_model.dart';
import 'package:flutter_rick_morty/core/features/screens/data/models/location_model.dart';
import 'package:flutter_rick_morty/core/features/screens/data/repositories/characters_reopitory.dart';
import 'package:flutter_rick_morty/core/features/screens/presentation/widgets/character_widget.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  CharacterCubit({required this.repository}) : super(CharacterInitial());
  final CharacterRepository repository;
  List<CharacterWidget> searchedCharacters = [];
  Future<void> getCharacters()async{
    emit(CharacterLoading());
    try{
      final CharactersModel charactersModel=await repository.getCharacter();
      emit(CharacterSuccess(charactersModel: charactersModel));
    }catch(e){
      emit(CharacterError());
    }

  }
  Future<void> searchCharacters(String name) async {
  emit(CharacterLoading());
  try {
    final CharactersModel charactersModel = await repository.getCharacter();
    final CharactersModel searchResult = _filterCharactersByName(charactersModel, name);
    emit(CharacterSuccess(
      charactersModel: charactersModel,
      searchResult: searchResult,
    ));
  } catch (e) {
    emit(CharacterError());
  }
}
Future<void> searchLocations(String name) async {
  emit(CharacterLoading());
  try {
    final LocationModel locationModel = await repository.getLocation();
    final LocationModel searchResultLocation = _filterLocationsByName(locationModel, name);
    emit(CharacterSuccess(
      locationModel: locationModel,
      searchResultLocation:searchResultLocation ,
    ));
  } catch (e) {
    emit(CharacterError());
  }
}

CharactersModel _filterCharactersByName(CharactersModel characters, String name) {
  final filteredResults = characters.results
      ?.where((character) =>
          character.name?.toLowerCase().contains(name.toLowerCase()) ?? false)
      .toList();

  return CharactersModel(results: filteredResults);
}
LocationModel _filterLocationsByName(LocationModel location, String name) {
  final filteredResults = location.results
      ?.where((character) =>
          character.name?.toLowerCase().contains(name.toLowerCase()) ?? false)
      .toList();

  return LocationModel(results: filteredResults);
}


Future<void> getLocation()async{
    emit(CharacterLoading());
    try{
      final LocationModel locationModel=await repository.getLocation();
      emit(CharacterSuccess(locationModel: locationModel));
    }catch(e){
      emit(CharacterError());
    }

  }
}
