import 'package:flutter/material.dart';
import 'package:story/models/product.dart';
import 'package:story/utils/constants.dart';
import 'package:story/views/components/custom_tween_builder.dart';
import 'package:story/views/components/image_clipper.dart';

class DetailsBody extends StatelessWidget {
  DetailsBody(
      {Key? key,
      required this.height,
      required this.product,
      required this.width})
      : super(key: key);

  Product product;
  double width;
  double height;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          
          CustomTweenBuilder(
              child: Container(
                alignment: Alignment.center,
                width: width,
                height: height * 0.65,
                decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.only(
                      bottomLeft: customRaduis,
                      bottomRight: customRaduis,
                    )),
                child: NetworkImageClipper(
                  height: height * 0.45,
                  width: width * 0.60,
                  radius: 25,
                  image: product.image,
                ),
              ),
              curve: Curves.bounceInOut,
              dx: 0.0,
              dy: -200),



          CustomTweenBuilder(
              child: Container(
                padding: const EdgeInsets.all(25),
                alignment: Alignment.center,
                child: Text(
                  product.title,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              curve: Curves.easeInOutBack,
              dx: -200,
              dy: 0.0),


          CustomTweenBuilder(
              child: Container(
                padding: const EdgeInsets.all(25),
                alignment: Alignment.center,
                child: Text(
                  product.desc,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              curve: Curves.easeInOutBack,
              dx: 0.0,
              dy: 200),
        ],
      ),
    );
  }
}
