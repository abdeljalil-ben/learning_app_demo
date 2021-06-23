import 'package:update_app/model/cardItem.dart';
import 'package:flutter/material.dart';

class DraggableWidget extends StatelessWidget {
  final CardItem item;
  DraggableWidget({Key? key, required this.item}) : super(key: key);

  static double size = 150;
  @override
  Widget build(BuildContext context) => Draggable<CardItem>(
    data: item,
    feedback: buildImage(),
    child: buildImage(),
    childWhenDragging: Container(),
  );

  Widget buildImage() => Container(
    height: size,
    width: size,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24), color: Colors.white),
    child: Image.asset(item.imageUrl),
  );
}