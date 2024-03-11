import 'package:dio/dio.dart';
import 'package:flutter_rick_morty/core/config/dio_settings.dart';
import 'package:flutter_rick_morty/core/consts/app_consts.dart';
import 'package:flutter_rick_morty/core/features/screens/data/models/charactes_model.dart';
import 'package:flutter_rick_morty/core/features/screens/data/models/location_model.dart';

 class CharacterRepository{
  Dio dio=DioSettings().dio;
  Future<CharactersModel> getCharacter() async {
    final Response response = await dio.get("${AppConsts.apiUrl}/character");
    return CharactersModel.fromJson(response.data);
  }

  Future<CharactersModel> searchCharacter(String name) async {
    final Response response = await dio.get("${AppConsts.apiUrl}/character",data: {
      "name":name
    });
    return CharactersModel.fromJson(response.data);
  }

  
  Future<LocationModel> getLocation() async {
    final Response response = await dio.get("${AppConsts.apiUrl}/location");
    return LocationModel.fromJson(response.data);
  }

}