
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_demo/models/UserModel.dart';


class Repository{

  final dio = Dio(BaseOptions(
    baseUrl: 'https://reqres.in/api/',
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
    contentType: 'application/json',
  ));



  Future<List<UserModel>> getUser(int page) async{
  Response response = await dio.get("users",queryParameters: {"page":page});
  if(response.statusCode == 200){
    final  data = response.data['data'];
    return data.map((userData) => UserModel.fromJson(userData)).toList().cast<UserModel>();
  }else{
    throw Exception(response.statusMessage);
  }
}
}