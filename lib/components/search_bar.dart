import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
