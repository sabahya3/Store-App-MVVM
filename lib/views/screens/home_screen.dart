import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:story/models/product.dart';
import 'package:story/utils/constants.dart';
import 'package:story/view_model/product_view_model.dart';
import 'package:story/views/components/custom_text_form_field.dart';
import 'package:story/views/components/home_screen_body.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController imageUrl;
  late TextEditingController title;
  late TextEditingController price;
  late TextEditingController desc;
  late GlobalKey<FormState> formKey;
  @override
  void initState() {
    super.initState();
    imageUrl = TextEditingController();
    title = TextEditingController();
    price = TextEditingController();
    desc = TextEditingController();
    formKey = GlobalKey<FormState>();

    context.read<ProductViewModel>().getProductsFromRepo();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
    
      body: HomeScreenBody(height: height, width: width),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.teal,
        icon: const Icon(Icons.add),
        onPressed: () {
          modalBottomSheetMenu(
              context,
              Container(
                padding: const EdgeInsets.all(15),
              
                child: SingleChildScrollView(
                  physics:const BouncingScrollPhysics(),
                  child: Form(
                    key: formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Enter image url'),
                          const SizedBox(
                            height: 20,
                          ),
                          DefaultFormField(
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter the url';
                                }
                              },
                              controller: imageUrl,
                              type: TextInputType.emailAddress,
                              icon: Icons.email_outlined),
                          const Text('Enter product name'),
                          const SizedBox(
                            height: 20,
                          ),
                          DefaultFormField(
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter product name';
                                }
                              },
                              controller: title,
                              type: TextInputType.emailAddress,
                              icon: Icons.email_outlined),
                          const Text('Enter product Description'),
                          const SizedBox(
                            height: 20,
                          ),
                          DefaultFormField(
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter product Description';
                                }
                              },
                              controller: desc,
                              type: TextInputType.emailAddress,
                              icon: Icons.email_outlined),
                          const Text('Enter product price'),
                          const SizedBox(
                            height: 20,
                          ),
                          DefaultFormField(
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter product price';
                                }
                              },
                              controller: price,
                              type: TextInputType.phone,
                              icon: Icons.email_outlined),
                          const SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: FloatingActionButton.extended(
                              backgroundColor: Colors.teal,
                              heroTag: 2,
                                icon: const Icon(Icons.add),
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    context.read<ProductViewModel>().addProduct(
                                        Product(
                                            title: title.text,
                                            desc: desc.text,
                                            image: imageUrl.text,
                                            price: price.text));
                                  }
                                  print('done!');
                                },
                                label: const Text('Confirm')),
                          )
                        ]),
                  ),
                ),
              ));
        },
        label: const Text('Add Product'),
      ),
    );
  }
}
