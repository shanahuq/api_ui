import 'package:api_ui/bloc/movie_details/bloc/movie_details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailedPage extends StatefulWidget {
  const DetailedPage({super.key, required this.id});
  final String id;

  @override
  State<DetailedPage> createState() => _DetailedPageState();
}

class _DetailedPageState extends State<DetailedPage> {
  @override
  void initState() {
    super.initState();
    context.read<MovieDetailsBloc>().add(FetchMovieDetailsEvent(id: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
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
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.search, color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
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
        child: SingleChildScrollView(
          child: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
            builder: (context, state) {
              if (state is MovieDetailsBlocloading) {
                return Center(child: CircularProgressIndicator());
              }
              if (state is MovieDetailsBlocError) {
                return Center(
                  child: Text(
                    'Error',
                    style: TextStyle(color: Color(0xffffffff)),
                  ),

                );
              }

              if (state is MovieDetailsBlocLoaded){

              final movie =BlocProvider.of<MovieDetailsBloc>(context).movieDetailsModel;
              return Column(
                children: [
                  SizedBox(height: 30.h),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: Image.network(
                      movie.first.thumbnails?.isNotEmpty == true
                          ? movie.first.thumbnails!.first.url! ?? ''
                          : 'https://via.placeholder.com/300x450',
                      height: 300.h,
                      // width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    movie.first.originalTitle ?? 'Unknown Title',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  SizedBox(
                    width: 400.w,
                    child: Divider(
                      color: const Color.fromARGB(104, 158, 158, 158),
                    ),
                  ),
                  Text(
                    'Type : ${movie.first.type ?? 'N/A'}',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      color: Colors.amber,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  SizedBox(
                    width: 400.w,
                    child: Divider(
                      color: const Color.fromARGB(104, 158, 158, 158),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star, color: Colors.amber),
                      SizedBox(width: 10.w),
                      Text(
                        '${movie.first.averageRating ?? 0}',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                          color: const Color.fromARGB(159, 255, 255, 255),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  SizedBox(
                    width: 400.w,
                    child: Divider(
                      color: const Color.fromARGB(104, 158, 158, 158),
                    ),
                  ),
                  Text(
                    'Description',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp,
                      color: Colors.amber,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    movie.first.description ?? 'No Description',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      color: Colors.white,
                    ),
                  ),
                ],
              );
              }else {return SizedBox();}
            },
          ),
        ),
      ),
    );
  }
}
