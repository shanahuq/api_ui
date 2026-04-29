import 'package:api_ui/repository/apis/movie_details_Api.dart';
import 'package:api_ui/repository/models/movie_details.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsApi movieDetailsApi = MovieDetailsApi();
  late List<MovieDetailsModel> movieDetailsModel;
  MovieDetailsBloc() : super(MovieDetailsInitial()) {
    on<FetchMovieDetailsEvent>((event, emit) async {
      emit(MovieDetailsBlocloading());
      try {
        movieDetailsModel = await movieDetailsApi.getmovieDetails(event.id);
        print('************************************');
        print("TRAILER FROM BLOC: ${movieDetailsModel.first.trailer}");
        emit(MovieDetailsBlocLoaded(movie: movieDetailsModel.first));
        print('***********Loaded***********');
      } catch (e) {
        print(e);
        emit(MovieDetailsBlocError());
      }
      // TODO: implement event handler
    });
  }
}
