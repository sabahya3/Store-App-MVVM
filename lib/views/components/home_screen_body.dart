import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:story/models/product.dart';
import 'package:story/view_model/product_view_model.dart';
import 'package:story/views/components/card_item.dart';
import 'package:story/views/screens/details.dart';

class HomeScreenBody extends StatelessWidget {
  HomeScreenBody({Key? key, required this.height, required this.width})
      : super(key: key);

  double width;
  double height;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 5, right: 5),
      child: Consumer<ProductViewModel>(
        builder: (context, value, child) {
          return value.products.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                )
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 2 / 3,
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 5),
                  itemCount: value.products.length,
                  itemBuilder: (context, index) {
                    Product obj = value.products[index];
                    return CustomCard(
                      height: height,
                      width: width,
                      image: obj.image,
                      desc: obj.desc,
                      title: obj.title,
                      onPress: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Details(
                                  product: obj,
                                )));
                      },
                      onLongPress: () {
                        context.read<ProductViewModel>().removeProduct(obj.id!);
                      },
                    );
                  });
        },
      ),
    );
  }
}
