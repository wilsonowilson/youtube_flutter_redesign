import 'package:flutter/material.dart';
import 'package:youtube_flutter_redesign/model/core/video.dart';

class RecommendedVideos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Video> videos = [
      Video('The magnificent landscape of Iceland', 'images/pic6.jpeg', '7:08',
          'Discovery', 2),
      Video('The Search for Icelandic Wildlife', 'images/pic3.jpeg', '15:32',
          'Discovery', 7),
      Video('The Definitive Brazil Travel Guide | BuzzFeed', 'images/pic1.jpeg',
          '15:32', 'Discovery', 3),
      Video('I lived in the Caribbean for 60 days.', 'images/pic4.jpeg',
          '15:32', 'Discovery', 5),
    ];
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 50.0),
            child: Text(
              "Recommended Videos",
              style: TextStyle(
                fontSize: 23,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 220,
            child: ListView.builder(
                padding: EdgeInsets.only(left: 50),
                scrollDirection: Axis.horizontal,
                itemCount: videos.length,
                itemBuilder: (context, index) {
                  Video video = videos[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        width: 270,
                        height: 200,
                        decoration: BoxDecoration(color: Colors.white),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 130,
                                  width: double.infinity,
                                  child: Image.asset(
                                    video.thumbnail,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    heightFactor: 4.7,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 4),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.grey.shade900
                                              .withOpacity(0.8)),
                                      child: Text(
                                        video.duration,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Container(
                              padding:
                                  EdgeInsets.only(left: 20, right: 20, top: 15),
                              child: Text(
                                video.title,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    letterSpacing: 0.45),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10.0, left: 20, bottom: 13),
                              child: Text(
                                '${video.owner} . ${video.time} days ago',
                                style: TextStyle(
                                    color: Colors.grey.shade500, fontSize: 12),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
