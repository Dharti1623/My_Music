import 'dart:ui';
import 'package:flutter/material.dart';


class CustomReorderableList extends StatefulWidget {
  const CustomReorderableList({super.key});

  @override
  State<CustomReorderableList> createState() => _CustomReorderableListState();
}
class _CustomReorderableListState extends State<CustomReorderableList> {
  final List<int> _items = List<int>.generate(20, (int index) => index);

  @override
  Widget build(BuildContext context) {
    Widget proxyDecorator(
        Widget child, int index, Animation<double> animation) {
      return AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget? child) {
          final double animValue = Curves.easeInOut.transform(animation.value);
          final double elevation = lerpDouble(0, 6, animValue)!;
          return Material(
            elevation: elevation,
            child: child,
          );
        },
        child: child,
      );
    }

    return ReorderableListView(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      proxyDecorator: proxyDecorator,
      children: <Widget>[
        for (int index = 0; index < _items.length; index += 1)
          Card(
            key: Key('$index'),
            elevation: 5.0,
            child: ListTile(
              title: Text('Item ${_items[index]+1}',style: TextStyle(fontSize: 20),),
              leading: const Icon(Icons.repeat_outlined, color: Colors.black),
            ),
          ),
      ],
      onReorder: (int oldIndex, int newIndex) {
        setState(() {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          final int item = _items.removeAt(oldIndex);
          _items.insert(newIndex, item);
        });
      },
    );
  }
}
