import 'package:flutter/material.dart';
import 'package:ventorapp/cart_item.dart';
import 'package:ventorapp/product_model.dart';

class CartProvider extends ChangeNotifier {
  final List<CartItem> _cartItems = [];
  List<CartItem> get cartItems => _cartItems;

  void addToCart(ProductModel product) {
    final index = _cartItems.indexWhere((item) => item.id == product.id);
    if (index >= 0) {
      _cartItems[index].quantity++;
    } else {
      _cartItems.add(
        CartItem(
          image: product.image,
          id: product.id,
          name: product.name,
          price: product.price,
        ),
      );
    }
    notifyListeners();
  }

  void increaseQuantity(int index) {
    _cartItems[index].quantity++;
    notifyListeners();
  }

  void decreasequantity(int index) {
    if (_cartItems[index].quantity > 1) {
      _cartItems[index].quantity--;
    } else {
      _cartItems.removeAt(index);
    }
    notifyListeners();
  }

  void removeItem(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  double get totalPrice {
    return _cartItems.fold(0, (sum, item) => sum + item.price * item.quantity);
  }

  int get totalItems => _cartItems.length;
}
