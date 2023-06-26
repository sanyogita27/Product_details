import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:loginform/login/bloc/user_bloc.dart';

class SearchRepo {
  Future<Either<dynamic, Failure>> getSearchRepo(
      {required String phone}) async {
    final dio = Dio();
    try {
      Response response =
          await dio.get("https://dummyjson.com/products?search", queryParameters: {phone: "title"});
      if (response.statusCode == 200) {
        var resData = response.data;
        print("success");
        return left(resData);
      } else
        return right(Failure(message: "failed"));
    } catch (e) {
      return right(Failure(message: "failed"));
    }
  }
}
