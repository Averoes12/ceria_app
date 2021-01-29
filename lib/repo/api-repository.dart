import 'dart:convert';

import 'package:ceria_app/model/user-model.dart';
import 'package:dio/dio.dart';

class ApiRepository {

  var baseUrl = "https://cerita.lumira.live/api/courier/login";

  Dio dio = Dio();
  Response response;

  Future<UserModel> login(String phoneNumber, String password) async{
    UserModel userModel;
    var qParams = {
      'phone' : '0$phoneNumber',
      'password' : '$password'
    };
    try{
      await dio.post(baseUrl, data: qParams).then((value) {
        print("LOGIN => ${value.data}");
        userModel = UserModel.fromJson(value.data);
      });
    }catch (e){
      print("Exception : $e");
      throw Exception(e);
    }
    return userModel;
  }



}