import 'package:flutter/material.dart';

class SidebarItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool selected;

  const SidebarItem({ Key? key, required this.icon, required this.title, this.selected = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Color selectedColor = Colors.white;
    Color unselectedColor = Colors.white.withOpacity(0.4);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          Icon(
            icon,
            color: selected == true ? selectedColor : unselectedColor,
            size: 18,
          ),
          SizedBox(width: 30),
          Text(
            title,
            style: TextStyle(
                fontSize: 14,
                color: selected == true ? selectedColor : unselectedColor),
          )
        ],
      ),
    );
  }
}
