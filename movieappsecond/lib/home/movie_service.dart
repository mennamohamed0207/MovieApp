import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';


import 'movie.dart';

class MovieService {
final Dio _dio = Dio();
 

  

  Future<List<Results>?> getMovies() async {
    try {
      Response response = await _dio.get(
          "https://api.themoviedb.org/3/movie/popular?api_key=e304808cb17a2b16cdbb66a01589d260");
      Movie newsResponse = Movie.fromJson(response.data);
      return newsResponse.results;
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }
}
