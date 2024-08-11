import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:youtube_flutter_redesign/widgets/sidebar_item.dart';

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
                  child: TextButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                              ),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromRGBO(255, 0, 0, 1),
                          ),
                      ),
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
