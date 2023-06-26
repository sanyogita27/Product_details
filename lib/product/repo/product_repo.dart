import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:loginform/login/bloc/user_bloc.dart';

class GetProductRepo {
  Future<Either<dynamic, Failure>> getProduct({required int id}) async {
    final dio = Dio();

    try {
      final response = await dio.get("https://dummyjson.com/products",
      queryParameters: {
        "limit":5,
        "skip":5,
      });
      if (response.statusCode == 200) {
        var resdata = response.data;
        print("successful");
        return left(resdata);
      } else {
        return right(Failure(message: "Failed"));
      }
    } catch (e) {
      return right(Failure(message: "Failed"));
    }
  }
}
