part of 'movie_details_bloc.dart';

@immutable
sealed class MovieDetailsState {}

final class MovieDetailsInitial extends MovieDetailsState {}

class MovieDetailsBlocloading extends MovieDetailsState {}

class MovieDetailsBlocLoaded extends MovieDetailsState {
   final Moviedetails movie;

  MovieDetailsBlocLoaded({required this.movie});
}

class MovieDetailsBlocError extends MovieDetailsState {}
