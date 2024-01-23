import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:vrit_project/feature/data/model/failure.dart';
import 'package:vrit_project/feature/data/model/shorten_url_model.dart';

class ShortUrlRepo {
  String apiUrl = 'https://api.rebrandly.com/v1/links';
  String apiKey = "04cf5b6069eb484e8d46dc2f9eb4c6c9";
  final _dio = Dio();
  Future<Either<Failure, dynamic>> shortUrl(body) async {
    try {
      final response = await _dio.post(
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'apikey': apiKey,
          },
        ),
        apiUrl,
        data: body,
      );
      return Right(shortenUrlModelFromJson(response.toString()));
    } on DioException catch (e) {
      return left(Failure(
        e.message.toString(),
      ));
    }
  }
}
