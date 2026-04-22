import 'package:api_ui/UI/detailed_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/movie list/bloc/movie_list_bloc.dart';

class ImdbUi extends StatefulWidget {
  const ImdbUi({super.key});

  @override
  State<ImdbUi> createState() => _ImdbUiState();
}

class _ImdbUiState extends State<ImdbUi> {
  final List<Map<String, dynamic>> movies = [
    {
      'image':
          'https://m.media-amazon.com/images/M/MV5BM2NmOTcyODYtN2YwMC00ZGEwLTkxZmQtMzBiZjc0YWE3N2ZkXkEyXkFqcGc@.jpg',
      'category': 'Title : ',
      'name': 'The Rivals of Amziah King',
      'type': ' Type : movie',
      'description':
          'Description:"Kateri loses her mother, leaves foster care. Reunites with former foster parent Amziah who mentors her, revealing hidden skills. Faces devastating situation, relies on newfound strength to seek justice."',
    },
    {
      'image':
          'https://m.media-amazon.com/images/M/MV5BZTIzNmQzYzUtNTdlNi00NmY5LThmNTYtMGFmZjUxMTgzOGNmXkEyXkFqcGc@.jpg',
      'category': 'Title : ',
      'name': 'The Lost Bus',
      'type': ' Type : movie',
      'description':
          'Description:"A wayward school bus driver and a dedicated school teacher battle to save 22 children from a terrifying inferno."',
    },
    {
      'image':
          'https://m.media-amazon.com/images/M/MV5BNzM4ZWEyZmUtNjg1YS00MDllLTk0MTUtNWU4ZGY0NjNiMmZkXkEyXkFqcGc@.jpg',
      'category': 'Title :',
      'name': 'Superhuman Body: World of Medical Marvels',
      'type': ' Type : movie',
      'description':
          'Description:"Explores the work of scientists and bioengineers who are behind groundbreaking medical innovations, such as CAR T-cell immunotherapy and the inner workings of the human body for treating blood cancers like leukemia."',
    },
    {
      'image':
          'https://m.media-amazon.com/images/M/MV5BOWQyNDA5NzYtODFlMi00MmQwLTlmYTMtYjI4NmYwYWNmMjYwXkEyXkFqcGc@.jpg',
      'category': 'Title : ',
      'name': 'The Oscars',
      'type': ' Type : movie',
      'description':
          'Description:"The 96th Academy Awards, held on March 10th, 2024 from the Dolby Threatre in Hollywood and hosted by comedian Jimmy Kimmel for the fourth time. The cultural phenomenon of "Barbenheimer" in six different categories is a recurring theme."',
    },
  ];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<MovieListBloc>(context).add(FetchMovieListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Icon(Icons.menu, color: Colors.white),
        title: Container(
          width: 68.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: Colors.amber,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
            child: Text(
              'IMDB',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 21.sp,
                color: Colors.black,
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.search, color: Colors.white),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Sign in',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18.sp,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: BlocBuilder<MovieListBloc, MovieListState>(
            builder: (context, state) {
              if (state is MovieListBlocLoading) {
                return Center(child: CircularProgressIndicator());
              }
              if (state is MovieListBlocError) {
                return Center(
                  child: Text('Error', style: TextStyle(color: Colors.white)),
                );
              }
              if (state is MovieListBlocLoaded) {
                final movie =
                    BlocProvider.of<MovieListBloc>(context).movieListModel;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30.h),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          childAspectRatio: 0.45,
                        ),
                        itemCount: movie.length,
                        itemBuilder: (context, index) {
                          final selectedMovie =movie[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (_) => DetailedPage(movie: selectedMovie)),
                              );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AspectRatio(
                                  aspectRatio: 2 / 3,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.network(
                                      movie[index].thumbnails?.isNotEmpty == true
                                          ? movie[index].thumbnails!.first.url ??
                                              ''
                                          : 'https://via.placeholder.com/300x450',
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              const Icon(
                                                Icons.broken_image,
                                                color: Colors.grey,
                                              ),
                                    ),
                                  ),
                                ),
                                // SizedBox(height: 8),
                                Padding(
                                  padding: EdgeInsets.only(top: 8.h),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        movie[index].type ?? 'Type',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(height: 2.h),
                                      Text(
                                        movie[index].originalTitle ?? 'Unknown Title',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.sp,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  '⭐${movie[index].averageRating ?? 0}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                  ),
                                ),
                                SizedBox(height: 2.h),
                                Text(
                                  movie[index].description ?? 'No description',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.sp,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              } else {
                return SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}
