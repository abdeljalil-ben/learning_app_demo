import 'package:update_app/model/cardItem.dart';
import 'package:update_app/model/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DragTargetWidget3 extends StatefulWidget {
  final CardItem cardItem;
  DragTargetWidget3({required this.cardItem});

  @override
  _DragTargetWidgetState3 createState() =>
      _DragTargetWidgetState3(cardItem: this.cardItem);
}

class _DragTargetWidgetState3 extends State<DragTargetWidget3> {
  CardItem cardItem;
  _DragTargetWidgetState3({required this.cardItem});
  @override
  Widget build(BuildContext context) {
    return DragTarget(
      onWillAccept: (data) {
        return true;
      },
      onAccept: (CardItem data) {
        if (data.imageUrl == cardItem.imageUrl) {
          // ScaffoldMessenger.of(context)
          //   .showSnackBar(SnackBar(content: const Text('well done')));
          //Provider.of<Data>(context, listen: false).removeLastItem();
          Provider.of<Data>(context, listen: false)
              .changeSuccessDropByIndex(true, 3);
          Provider.of<Data>(context, listen: false)
              .changeSuccessDropByIndex(false, 1);
          Provider.of<Data>(context, listen: false)
              .changeSuccessDropByIndex(false, 2);
          Provider.of<Data>(context, listen: false)
              .changeSuccessDropByIndex(false, 0);
          Provider.of<Data>(context, listen: false).changeAcceptedData(data);
          // Provider.of<Data>(context, listen: false).removeLastCenterItem();
        }
      },
      builder: (context, candidateData, rejectedData) {
        if (Provider.of<Data>(context, listen: false).isSuccessDropList(3)) {
          return buildTarget(
              Provider.of<Data>(context, listen: false).getAcceptedData);
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

  Widget buildTarget(CardItem? item) {
    if (item != null) {
      return Transform(
          alignment: FractionalOffset.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.002)
            ..rotateX(0.20),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              child: Container(
                height: 150,
                width: 150,
                color: Colors.white,
                child: Center(child: Image.asset(item.imageUrl)),
              ),
            ),
          ));
    } else {
      return Text('Errors');
    }
  }
}