import 'dart:math';

import 'package:update_app/model/cardItem.dart';

class Constants {
  static String HOME_SCREEN = 'HOME_SCREEN';
  final allCards = [
    CardItem(
      imageUrl: 'assets/book-307045_960_720.png',
      type: PictureType.tools,
      name: "كتاب",
    ),
    CardItem(
      imageUrl: 'assets/tree-576847_960_720.png',
      type: PictureType.nature,
      name: "شجرة",
    ),
    CardItem(
      imageUrl: 'assets/tomato-153272__340.png',
      type: PictureType.fruits,
      name: "طماطم",
    ),
    CardItem(
      imageUrl: 'assets/lion-564925_960_720.png',
      type: PictureType.Anim,
      name: "اسد",
    )
  ];
  List<CardItem> getRandomCardItem() {
    var rng = new Random();
    List<CardItem> cardGenerated = [];
    List<int> randomGenerated = [];
    int index = 0;

    while (index < 4) {
      var randomIndex = rng.nextInt(allCards.length);
      if (!randomGenerated.contains(randomIndex)) {
        index = index + 1;
        cardGenerated.add(allCards.elementAt(randomIndex));
        randomGenerated.add(randomIndex);
      }
    }
    return cardGenerated;
  }
}