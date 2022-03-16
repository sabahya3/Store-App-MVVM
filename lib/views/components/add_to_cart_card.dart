import 'package:flutter/material.dart';

class AddToCartCard extends StatelessWidget {
  AddToCartCard(
      {Key? key,
      required this.count,
      required this.decrement,
      required this.desc,
      required this.height,
      required this.image,
      required this.increment,
      required this.title,
      required this.total,
      required this.width})
      : super(key: key);

  double width;
  double height;
  String title;
  String image;
  String total;
  String count;
  String desc;
  Function increment;
  Function decrement;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(15),
      width: width,
      height: height * 0.27,
      child: Column(
        children: [
          Text(title),
          const Divider(
            color: Colors.black,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                    height: height * 0.20,
                    width: width * 0.35,
                    child: Image.network(
                      image,
                      fit: BoxFit.fill,
                    )),
              ),
              Column(
                children: [
                  SizedBox(
                      width: width * 0.40,
                      child: Text(
                        desc,
                        softWrap: true,
                        maxLines: 4,
                      )),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Row(
                    children: [
                      Text(total),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      //    const Spacer(),
                      FloatingActionButton.small(
                          onPressed: () {
                            decrement();
                          },
                          child: const Icon(
                            Icons.remove,
                          )),
                      SizedBox(
                        width: width * 0.01,
                      ),
                      Text(
                        count,
                        style: const TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        width: width * 0.01,
                      ),
                      FloatingActionButton.small(
                          onPressed: () {
                            increment();
                          },
                          child: const Icon(
                            Icons.add,
                          ))
                    ],
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
