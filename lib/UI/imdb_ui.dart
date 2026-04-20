import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.menu, color: Colors.white),
                        Padding(
                          padding: EdgeInsets.only(left: 30.w),
                          child: Container(
                            width: 60.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              color: Colors.amber,
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.h),
                              child: Center(
                                child: Text(
                                  'IMDB',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16.sp,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 40.w),
                      child: Row(
                        children: [
                          Icon(Icons.search, color: Colors.white),
                          Padding(
                            padding: EdgeInsets.only(left: 15.w),
                            child: Text(
                              'Sign in',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 0.45,
                  ),
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AspectRatio(
                          aspectRatio: 2 / 3,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              movies[index]['image'],
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              movies[index]['category'],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                movies[index]['name'],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          movies[index]['type'],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          movies[index]['description'],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.sp,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
