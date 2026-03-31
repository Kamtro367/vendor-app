import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ventorapp/cart_page.dart';
import 'package:ventorapp/cart_provider.dart';
import 'package:ventorapp/product_model.dart';
import 'package:ventorapp/profile_page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});
  final List<ProductModel> products = [
    ProductModel(
      id: 1,
      name: "Lipstick",
      price: 400,
      image: 'assets/images/lipstick.jpg',
    ),
    ProductModel(
      id: 2,
      name: "Foundation",
      price: 800,
      image: 'assets/images/foundation.jpg',
    ),
    ProductModel(
      id: 3,
      name: "Eyeliner",
      price: 200,
      image: 'assets/images/eyeliner.jpg',
    ),
    ProductModel(
      id: 4,
      name: "Mascara",
      price: 500,
      image: 'assets/images/mascara.jpg',
    ),
    ProductModel(
      id: 5,
      name: "Lipliner",
      price: 150,
      image: 'assets/images/lipliner.jpg',
    ),
    ProductModel(
      id: 6,
      name: "Sunscreen",
      price: 700,
      image: 'assets/images/sunscreen.jpg',
    ),
  ];

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"), centerTitle: true,
        backgroundColor: Colors.green[300],
        foregroundColor: Colors.white,
        actions: [
          
        IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage()));
        }, icon: Icon(Icons.person_2_outlined)),
        IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage()));
          }, icon: Icon(Icons.shopping_bag_outlined))
        ],
       ),
      body: GridView.builder(
        itemCount: widget.products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) {
          final product = widget.products[index];
          return Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [



                Expanded(
                  child: Image.asset(
                    product.image,
                    width: double.infinity,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),

                SizedBox(height: 5),

                Text(product.name),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("₹ ${product.price}"),
                    IconButton(
                      onPressed: () {
                         Provider.of<CartProvider>(context, listen: false).addToCart(product);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Item added to cart")));
       
                      },
                      icon: Icon(Icons.shopping_bag_outlined),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
