import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:youtube_flutter_redesign/library/dovetail.dart';
import 'package:youtube_flutter_redesign/models/channel.dart';
import 'package:youtube_flutter_redesign/models/mix.dart';
import 'package:youtube_flutter_redesign/models/video.dart';
import 'package:youtube_flutter_redesign/sidebar_item.dart';

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
                  SearchBar(),
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

class YoutubeMixes extends StatelessWidget {
  const YoutubeMixes({
    Key key,
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

class PopularChannels extends StatelessWidget {
  const PopularChannels({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Channel> channels = [
      Channel('Marques Brownlee', "10.2M", '1,027', 'images/you1.jpg'),
      Channel('Jacksfilms', "5.1M", '746', 'images/you2.jpg'),
      Channel('Reso Coder', "58.3K", '107', 'images/you3.jpg'),
      Channel('iJustine', "5.7M", '1,158', 'images/you4.jpg'),
      Channel('Robert Brunhage', "30.7K", '204', 'images/you5.jpg'),
      Channel('Pewdiepie', "101M", '7,309', 'images/you6.png'),
    ];
    return Padding(
      padding: const EdgeInsets.only(left: 50.0, right: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Popular Channels",
            style: TextStyle(
              fontSize: 23,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 30),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.06),
                borderRadius: BorderRadius.circular(10)),
            child: ListView.separated(
                physics: ScrollPhysics(),
                separatorBuilder: (context, index) => Container(
                      height: 1,
                      color: Colors.white.withOpacity(0.08),
                    ),
                shrinkWrap: true,
                itemCount: channels.length,
                itemBuilder: (context, index) {
                  Channel channel = channels[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(channel.logo),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Text(
                                channel.name,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Text(
                                    " • ${channel.subCount} subscribers • ${channel.vidCount} videos",
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: false,
                                    style: TextStyle(
                                      color: Colors.white30,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 110,
                          height: 30,
                          child: FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7)),
                              color: Color.fromRGBO(255, 0, 0, 1),
                              onPressed: () {},
                              child: Text(
                                "SUBSCRIBE",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2),
                              )),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 40),
      child: Row(
        children: [
          Icon(
            CupertinoIcons.search,
            color: Colors.white,
          ),
          SizedBox(width: 30),
          Expanded(
            child: Text(
              "Search...",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Text(
            "Wilson Wilson",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          SizedBox(width: 20),
          CircleAvatar(
            backgroundImage: AssetImage('images/me.jpeg'),
          ),
          SizedBox(width: 10),
          Icon(
            Icons.arrow_drop_down,
            size: 15,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}

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

class SideBar extends StatelessWidget {
  final TextStyle headingStyle = TextStyle(
      color: Colors.white,
      fontSize: 12,
      fontWeight: FontWeight.bold,
      letterSpacing: 2);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 50),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'images/logo.png',
                width: 86,
              ),
              SizedBox(
                height: 70,
              ),
              Text("MENU", style: headingStyle),
              SizedBox(height: 10),
              SidebarItem(
                icon: FontAwesomeIcons.home,
                selected: true,
                title: 'Home',
              ),
              SidebarItem(
                icon: FontAwesomeIcons.fire,
                title: 'Trending',
              ),
              SidebarItem(
                icon: FontAwesomeIcons.youtube,
                title: 'Subscriptions',
              ),
              SidebarItem(
                icon: Icons.radio_button_checked,
                title: 'Live',
              ),
              SizedBox(height: 30),
              Text("LIBRARY", style: headingStyle),
              SizedBox(height: 10),
              SidebarItem(
                icon: FontAwesomeIcons.solidClock,
                title: 'History',
              ),
              SidebarItem(
                icon: FontAwesomeIcons.bars,
                title: 'Queue',
              ),
              SidebarItem(
                icon: FontAwesomeIcons.heart,
                title: 'Liked Videos',
              ),
              SizedBox(height: 30),
              Text("PLAYLISTS", style: headingStyle),
              SizedBox(height: 10),
              SidebarItem(
                icon: FontAwesomeIcons.solidListAlt,
                title: 'Flutter Favorites',
              ),
              SidebarItem(
                icon: FontAwesomeIcons.solidListAlt,
                title: 'Daily Vlogs',
              ),
              SizedBox(height: 30),
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: double.maxFinite,
                  height: 50,
                  child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      color: Color.fromRGBO(255, 0, 0, 1),
                      onPressed: () {},
                      child: Text(
                        "UPLOAD VIDEO",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2),
                      )),
                ),
              ),
              SizedBox(height: 10),
              Center(
                  child: Text(
                "YouTube App v2.45",
                style: TextStyle(
                    color: Colors.grey.withOpacity(0.3), fontSize: 11),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
