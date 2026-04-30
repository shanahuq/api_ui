
                                                                                                                    
import 'package:api_ui/repository/models/movie_details.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';


import '../../../repository/apis/movie_list_Api.dart';
import '../../../repository/models/movie_list_models.dart';
import 'movie_list_bloc.dart';


part 'movie_list_event.dart';
part 'movie_list_state.dart';

class MovieListBloc extends Bloc<MovieListEvent, MovieListState> {
  MovieListApi movieListApi = MovieListApi();
  late List<Movielist> movieListModel;
   

  MovieListBloc() : super(MovieListInitial()) {
    on<MovieListEvent>((event, emit) async {
      emit(MovieListBlocLoading());
      try {
        movieListModel = await movieListApi.getmovies();
        print('***********************************');
        emit(MovieListBlocLoaded());
        print('************Loaded***********');
      }
      catch(e) {
        print(e);
        emit(MovieListBlocError());
      }
      // TODO: implement event handler
    });
  }
}
