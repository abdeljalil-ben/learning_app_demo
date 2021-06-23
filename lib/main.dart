import 'package:update_app/centerCard.dart';
import 'package:update_app/dragTarget.dart';
import 'package:update_app/dragTarget1.dart';
import 'package:update_app/dragTarget2.dart';
import 'package:update_app/dragTarget3.dart';
import 'package:update_app/model/constants.dart';
import 'package:update_app/model/data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MaterialApp(
    title: 'Drag and Drop Demo',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.green),
    routes: <String, WidgetBuilder>{
      Constants.HOME_SCREEN: (BuildContext context) =>
          ChangeNotifierProvider(create: (context) => Data(), child: MyApp())
    },
    initialRoute: Constants.HOME_SCREEN,
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyanAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<Data>(context, listen: false).initializeDraggableList();
          // Provider.of<Data>(context, listen: false).initializeCenterItems();
          Provider.of<Data>(context, listen: false).changeSuccessDrop(false);
        },
        elevation: 20.0,
        child: Icon(Icons.skip_next),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DragTargetWidget(
                        cardItem: Provider.of<Data>(context).getFirstItem),
                    DragTargetWidget1(
                        cardItem: Provider.of<Data>(context).getSecondItem)
                  ],
                ),
                CenterCard(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DragTargetWidget2(
                        cardItem: Provider.of<Data>(context).getTherdItem),
                    DragTargetWidget3(
                        cardItem: Provider.of<Data>(context).getFourthItem)
                  ],
                )
              ],
            ),
          )),
    );
  }
}
/*
void dmsd(){
  bool IsBack =treu;
  double angle;

}
void _flip(){
  SetState(){
    angle=(angle *pi) %(2*pi)
  }
}

 */