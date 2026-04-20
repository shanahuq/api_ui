import 'package:api_ui/repository/api\'s/movie_list_Api.dart';
import 'package:api_ui/repository/models/movie_list_models.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../repository/models/movie_list_models.dart';


part 'movie_list_event.dart';
part 'movie_list_state.dart';

class MovieListBloc extends Bloc<MovieListEvent, MovieListState> {
  MovieListApi movieListApi = MovieListApi();
  late List<MovieListModel> MovieListModel;
  MovieListBloc() : super(MovieListInitial()) {
    on<MovieListEvent>((event, emit) async {
      emit(MovieListBlocLoadeding());
      try {
        MovieListModel = await MovieListApi.MovieListEvent();
        print('***********************************');
        emit(ModelListBlocLoaded());
        print('************Loaded***********');
      }
      catch(e) {
        print(e);
        emit(ModelListBlocError());
      }
      // TODO: implement event handler
    });
  }
}
