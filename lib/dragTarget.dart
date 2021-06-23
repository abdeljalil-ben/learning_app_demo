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
  _DragTargetWidgetState({required this.cardItem});

  get key => null;
  @override
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

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
          Provider.of<Data>(context, listen: false) //هذا البروفايدر عبارة عن مستمع لdata اول ما داتا يصل الى notifierlistener يعمل setstate للقيم
              .changeSuccessDropByIndex(true, 0);// // طبق النوتيفاير ليسينر على دراغتارغت 1
          print("button1");//تذهب لاقرب كلاس وهي دراغتارغت// 1 وتعمل اعادة بناء حسب لبياناتها
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
              Provider.of<Data>(context, listen: false).getAcceptedData);
        } else {
          return FlipCard(
            key: cardKey,
            front: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                child: Container(
                  height: 150,
                  width: 150,
                  color: Colors.white,
                  child: Center(child: Image.asset(cardItem.imageUrl)),
                ),
              ),
            ),
          back: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              child: Container(
                height: 150,
                width: 150,
                color: Colors.white,
                child: Center(child: Image.asset(cardItem.name)),
              ),
            ),
          ),
          );
        }
      },
    );
  }

  Widget buildTarget(CardItem? item) {
    if (item != null) {
      return FlipCard(
        key: cardKey,
        front: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            child: Container(
              height: 150,
              width: 150,
              color: Colors.white,
              child: Center(child: Image.asset(cardItem.imageUrl)),
            ),
          ),
        ),
        back: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            child: Container(
              height: 150,
              width: 150,
              color: Colors.white,
              child: Center(child: Image.asset(cardItem.name)),
            ),
          ),
        ),
      );



    } else {
      return Text('Errors');
    }
  }
}