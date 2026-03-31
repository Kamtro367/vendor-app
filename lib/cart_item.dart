class CartItem {
  final String image;
  final int id;
  final String name;
  final double price;
  int quantity;


  CartItem({
    required this.image,
    required this.id,
    required this.name,
    required this.price,
    this.quantity =1,
  });
}