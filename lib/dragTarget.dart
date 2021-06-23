import 'dart:math';

import 'package:flip_card/flip_card.dart';
import 'package:update_app/model/cardItem.dart';
import 'package:update_app/model/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DragTargetWidget extends StatefulWidget {
  final CardItem cardItem;
  DragTargetWidget({required this.cardItem});

  @override
  _DragTargetWidgetState createState() =>
      _DragTargetWidgetState(cardItem: this.cardItem);
}

class _DragTargetWidgetState extends State<DragTargetWidget> {
  CardItem cardItem;
  bool flip = false;
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  _DragTargetWidgetState({required this.cardItem});

  get key => null;

  @override
  Widget build(BuildContext context) {
    return DragTarget(
      onWillAccept: (data) {
        return true;
      },
      onAccept: (CardItem data) {
        if (data.imageUrl == cardItem.imageUrl) {
          print("the value of place is :");


          // ScaffoldMessenger.of(context)
          //   .showSnackBar(SnackBar(content: const Text('well done')));
          //Provider.of<Data>(context, listen: false).removeLastItem();
          Provider.of<Data>(context,
              listen: false) //هذا البروفايدر عبارة عن مستمع لdata اول ما داتا يصل الى notifierlistener يعمل setstate للقيم
              .changeSuccessDropByIndex(
              true, 0); // // طبق النوتيفاير ليسينر على دراغتارغت 1
          print(
              "button1"); //تذهب لاقرب كلاس وهي دراغتارغت// 1 وتعمل اعادة بناء حسب لبياناتها
          Provider.of<Data>(context, listen: false)
              .changeSuccessDropByIndex(false, 1);
          Provider.of<Data>(context, listen: false)
              .changeSuccessDropByIndex(false, 2);
          Provider.of<Data>(context, listen: false)
              .changeSuccessDropByIndex(false, 3);
          Provider.of<Data>(context, listen: false).changeAcceptedData(data);
          //      Provider.of<Data>(context, listen: false).removeLastCenterItem();
        }
      },
      builder: (context, candidateData, rejectedData) {
        if (Provider.of<Data>(context, listen: false).isSuccessDropList(0)) {
          return buildTarget(
              Provider
                  .of<Data>(context, listen: false)
                  .getAcceptedData);
        } else {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              child: Container(
                height: 150,
                width: 150,
                color: Colors.white,
                child: Center(child: Image.asset(cardItem.imageUrl)),
              ),
            ),
          );
        }
      },
    );
  }

  double _rotateFactor = 0.05;

  void _changeAngle(double factor) {
    _rotateFactor = factor;
    setState(() {});
  }

  Widget buildTarget(CardItem? item) {
    if (item != null) {
      return Transform(
          alignment: FractionalOffset.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.002)
            ..rotateY(pi * _rotateFactor),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              child: Container(
                height: 150,
                width: 150,
                color: Colors.white,
                child: Center(child: Text(item.name)),
              ),
            ),
          ));
    } else {
      return Text('Errors');
    }
  }
}