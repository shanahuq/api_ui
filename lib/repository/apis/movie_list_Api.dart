import 'dart:convert';

import 'package:http/http.dart';

import '../models/movie_list_models.dart';
import 'Api_client.dart';
import 'Api_exception.dart';

class MovieListApi {
  ApiClient apiClient = ApiClient();

  Future<List<Movielist>> getmovies() async {
    String trendingPath =
        "https://imdb236.p.rapidapi.com/api/imdb/cast/nm0000190/titles";
    Response response = await apiClient.invokeAPI(trendingPath, "GET", null);
    print(response.body);
    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      List<Movielist> movieList =
          jsonList.map((json) => Movielist.fromJson(json)).toList();
      return movieList;
    } else {
      final errorBody = jsonDecode(response.body);
      throw ApiException(
        'Error : ${errorBody['message'] ?? 'Unknoen error'}',
        response.statusCode,
      );
    }
  }
}
