import 'dart:ui';

// Remove the unnecessary import statement
import 'package:flutter/material.dart';
import 'package:youtube_flutter_redesign/components/popular_channels.dart';
import 'package:youtube_flutter_redesign/components/recommended_videos.dart';
import 'package:youtube_flutter_redesign/components/search_bar.dart' as YTSearchBar;
import 'package:youtube_flutter_redesign/components/side_bar.dart';
import 'package:youtube_flutter_redesign/components/youtube_mixes.dart';
import 'package:youtube_flutter_redesign/library/dovetail.dart';

void main() {
  runApp(YouTube());
}

class YouTube extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Product Sans'),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              width: double.maxFinite,
              height: double.maxFinite,
              child: Image.asset(
                'images/bg.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 30.0,
                  sigmaY: 30.0,
                ),
                child: Container(
                  alignment: Alignment.center,
                  child: Text(' '),
                ),
              ),
            ),
            Home(),
          ],
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color sidebarColor = Color.fromRGBO(10, 10, 30, 0.98);
    Color screenColor = Color.fromRGBO(10, 10, 30, 0.7);

    return Dovetail(
      columnCount: 5,
      children: [
        DovePin(
          flex: 1,
          child: Container(
            color: sidebarColor,
            child: SideBar(),
          ),
        ),
        DovePin(
          flex: 4,
          child: Container(
            color: screenColor,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  YTSearchBar.SearchBar(),
                  RecommendedVideos(),
                  SizedBox(height: 60),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 6,
                        child: PopularChannels(),
                      ),
                      Flexible(
                        flex: 4,
                        child: YoutubeMixes(),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
