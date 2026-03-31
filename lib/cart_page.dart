import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ventorapp/cart_provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart"),
        backgroundColor: Colors.green[300],
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      body: cartProvider.cartItems.isEmpty
          ? Center(child: Text("Your cart is empty"))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartProvider.cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartProvider.cartItems[index];
                      return Card(
                        margin: EdgeInsets.all(10),
                        child: Padding(
                          padding: EdgeInsets.all(10),

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        height: 80,
                                        width: 80,
                                        child: Image.asset(item.image,)),
                                    Column(
                                    children: [
                                      Text(
                                        item.name,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      
                                      SizedBox(height: 10),
                                      Text("₹ ${item.price * item.quantity}"),
                                    ],
                                  ),
                                    ],
                                  ),
                                  
                                ],
                              ),

                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      
                                        cartProvider.decreasequantity(index);
                                      
                                    },
                                    icon: Icon(Icons.remove),
                                  ),
                                  Text(item.quantity.toString()),
                                  IconButton(
                                    onPressed: () {
                                      
                                        cartProvider.increaseQuantity(index);
                                      
                                    },
                                    icon: Icon(Icons.add),
                                  ),
                                ],
                              ),
                              IconButton(
                                onPressed: () {
                                  cartProvider.removeItem(index);
                                },
                                icon: Icon(Icons.delete, color: Colors.red),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  
                ),

                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.green[50],
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),

                  ),child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                      Text("₹ ${cartProvider.totalPrice}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),)
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
