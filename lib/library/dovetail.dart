library dovetail;

import 'package:flutter/material.dart';
/// A Calculator.
class Dovetail extends StatelessWidget {
  final List<DovePin> children;
  final int columnCount;

  Dovetail({Key? key, required this.columnCount, required this.children}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double singleBlock = width/columnCount;
    List<Widget> rChildren = [];
    int childrenTotalFlex = 0;


    for(var item in children){
      childrenTotalFlex = childrenTotalFlex + item.flex;
    }

    assert(childrenTotalFlex <= columnCount );
    assert(columnCount != null);
    int currentMax = 0;
    for(int i = 0; i < columnCount; i++){

      if(children.length > i){
        var child = children[i];
        rChildren.add(Container(
          width: singleBlock * child.flex,
          child: child,
        ));
      }
    }


    return Row(
        children: rChildren
    );
  }
}

class DovePin extends StatelessWidget {
  final int flex;
  final Widget child;

  const DovePin({ Key? key, required this.flex, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
