enum PictureType { Anim, fruits,nature,tools }

class CardItem {
  String imageUrl;
  PictureType type;
  String name;

  CardItem({required this.imageUrl,required this.type,required this.name});
}
