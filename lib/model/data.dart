import 'dart:math';
import 'package:update_app/model/cardItem.dart';
import 'package:update_app/model/constants.dart';
import 'package:flutter/cupertino.dart';
class Data with ChangeNotifier {
  bool successDrop = false;
  int place=0;
  List<bool> successDropList = [false, false, false, false, false];
  List<bool> finished = [false, false, false, false, false];
  List<CardItem> items = Constants().getRandomCardItem();
  late CardItem centerItems;
  CardItem? acceptedData;

  bool get isSuccessDrop => successDrop;
  bool isSuccessDropList(int index) {
    return successDropList[index];
  }

  List<CardItem> get itemsList => items;
  CardItem? get getAcceptedData => acceptedData;
  CardItem get getFirstItem => items.elementAt(0);
  CardItem get getSecondItem => items.elementAt(1);
  CardItem get getTherdItem => items.elementAt(2);
  CardItem get getFourthItem => items.elementAt(3);

  set setSuccessDrop(bool status) {
    successDrop = status;
    notifyListeners();
  }

  // set setSuccessDropList(bool status,int index) {
  //   successDropList[index] = status;
  //   notifyListeners();
  // }

  changeCenterItem() {
    var rng = new Random();
    bool end = false;
    while ((!finished[0] || !finished[1] || !finished[2] || !finished[3]) &&
        !end) {
      var randomIndex = rng.nextInt(items.length);
      if (finished[randomIndex] == false) {
        end = true;
        finished[randomIndex] = true;
        centerItems = items[randomIndex];
        //notifyListeners();
      }
    }
  }

  changeAcceptedData(CardItem data) {
    acceptedData = data;
    notifyListeners();
  }

  changeSuccessDrop(bool status) {
    setSuccessDrop = status;
  }

  changeSuccessDropByIndex(bool status, int index) {
    successDropList[index] = status;
  }

  removeLastItem() {
    items.removeLast();
    notifyListeners();
  }

  addItemToList(CardItem item) {
    items.add(item);
    notifyListeners();
  }

  initializeDraggableList() {
    items = Constants().getRandomCardItem();
    notifyListeners();
  }

  CardItem getCenterItem() {
    changeCenterItem();
    return centerItems;
  }
}