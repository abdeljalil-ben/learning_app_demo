import 'package:update_app/dragabbal_widget.dart';
import 'package:update_app/model/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class CenterCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Provider.of<Data>(context, listen: false).initializeCenterItems();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        child: Container(
            height: 150,
            width: 150,
            child: Stack(
              alignment: Alignment.center,
              children: [
                DraggableWidget(
                    item: Provider.of<Data>(context, listen: false)
                        .getCenterItem())
              ],
              //children: Provider.of<Data>(context, listen: false)
              //  .centerItems
              //.map((item) => DraggableWidget(item: item))
              //.toList()
              //    .map((animal) => DraggableWidget(animal: animal))
              //  .toList(),
            )),
      ),
    );
  }
}