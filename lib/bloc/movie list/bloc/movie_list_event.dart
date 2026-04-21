part of 'movie_list_bloc.dart';

@immutable
sealed class MovieListEvent {}
class FetchMovieListEvent extends MovieListEvent {}