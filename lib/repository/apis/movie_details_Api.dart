import 'package:api_ui/repository/apis/Api_client.dart';
import 'package:api_ui/repository/apis/api_exception.dart';
import 'package:api_ui/repository/models/movie_details.dart';
import 'package:http/http.dart';
import 'dart:convert';
class MovieDetailsApi {
ApiClient apiClient = ApiClient();
Future <List<MovieDetailsModel>> getmovieDetails(String id ) async {
  String trendingPath = "https://imdb236.p.rapidapi.com/api/imdb/$id";
  Response response = await apiClient.invokeAPI(trendingPath, "GET", null);
  print(response.body);
  if (response.statusCode == 200) {
    Map<String,dynamic> jsonMap = json.decode(response.body);
    MovieDetailsModel movie = MovieDetailsModel.fromJson(jsonMap);
  return [MovieDetailsModel.fromJson(jsonMap)];
  }else{
    final errorBody = json.decode(response.body);
    throw ApiException(
      'Error : ${errorBody['message'] ?? 'Unknown error'}',
      response.statusCode
    );
  }
  }
}
