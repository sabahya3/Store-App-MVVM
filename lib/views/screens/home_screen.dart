import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:story/view_model/product_view_model.dart';
import 'package:story/views/components/home_screen_body.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();

    context.read<ProductViewModel>().getProductsFromRepo();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
        ),
        body: HomeScreenBody(height: height, width: width));
  }
}
