import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:story/utils/constants.dart';
import 'package:story/view_model/cart_view_model.dart';
import 'package:story/views/components/custom_animated_builder.dart';
import 'package:story/views/screens/user_info.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  int index = 0;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this,duration:const Duration(milliseconds: 700));
  }
   toggle() {
    controller.isDismissed == true
        ? controller.forward()
        : controller.reverse();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            toggle();
          },
          icon: const Icon(Icons.menu),
        ),
        backgroundColor: Colors.teal,
        title: pageTitle[index],
        centerTitle: true,
      ),
      body: Stack(
        children: [
          UserInfo(),
          CustomAnimatedBuilder(controller: controller, widget: pages[index]),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          currentIndex: index,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.store), label: 'home'),
            BottomNavigationBarItem(
                icon:  Icon(Icons.shopping_cart_checkout), label: 'cart'),
          ]),
    );
  }
}
