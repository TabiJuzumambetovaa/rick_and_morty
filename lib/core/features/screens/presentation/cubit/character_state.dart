part of 'character_cubit.dart';

@immutable
sealed class CharacterState {}

final class CharacterInitial extends CharacterState {}
final class CharacterLoading extends CharacterState {}
final class CharacterSuccess extends CharacterState {
  final CharactersModel? charactersModel;
  final LocationModel? locationModel;
   final CharactersModel? searchResult; 
   final LocationModel? searchResultLocation; 


  CharacterSuccess({this.locationModel, this.charactersModel,this.searchResult,this.searchResultLocation});
}

final class CharacterError extends CharacterState {}

