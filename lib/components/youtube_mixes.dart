import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:youtube_flutter_redesign/model/core/mix.dart';

class YoutubeMixes extends StatelessWidget {
  const YoutubeMixes({
     Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Mix> mixes = [
      Mix("Chill Vibes", '+50', 'images/pic8.jpg'),
      Mix("Summer Vibes", '+100', 'images/pic2.jpeg'),
      Mix("Night Vibes", '+150', 'images/pic7.jpeg'),
      Mix("Evening Vibes", '+50', 'images/pic5.jpeg'),
    ];
    return Padding(
      padding: const EdgeInsets.only(left: 50.0, right: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Youtube Mixes",
            style: TextStyle(
              fontSize: 23,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 30),
          ListView.builder(
            physics: ScrollPhysics(),
            itemCount: mixes.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              Mix mix = mixes[index];
              return Container(
                height: 100,
                margin: EdgeInsets.only(bottom: 10),
                width: double.maxFinite,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          mix.image,
                        )),
                    borderRadius: BorderRadius.circular(10)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 30.0,
                          sigmaY: 30.0,
                        ),
                        child: Center(
                            child: Text(
                          "${mix.name.toUpperCase()} • ${mix.count}",
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
