part of 'movie_list_bloc.dart';

@immutable
sealed class MovieListState {}

final class MovieListInitial extends MovieListState {}
class MovieListBlocLoading extends MovieListState{}
class MovieListBlocLoaded extends MovieListState{}
class MovieListBlocError extends MovieListState{}