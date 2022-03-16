import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  CustomCard(
      {Key? key,
      required this.height,
      required this.image,
      required this.desc,
      required this.onPress,
      required this.title,
      required this.width,
      required this.onLongPress})
      : super(key: key);

  double height;
  double width;
  String image;
  String title;
  String desc;
  Function onPress;
  Function onLongPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress();
      },
      onLongPress: () {
        onLongPress();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.teal.withOpacity(0.4),
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: width * 0.45,
                height: height * 0.30,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        fit: BoxFit.fill, image: NetworkImage(image))),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 5, left: 10),
              alignment: Alignment.center,
              child: Text(desc),
            ),
            Container(
              alignment: Alignment.center,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Spacer(),
                  Text(title),
                  const Spacer(),
                  const Icon(Icons.shopping_bag),
                  const Spacer(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
