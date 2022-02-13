import 'package:wemove_cart/models/product.dart';
import 'package:uuid/uuid.dart';

class CartItem {
  CartItem({
    required this.product,
    this.quantity = 1,
  });

  var id = const Uuid();
  Product product;
  int quantity;

  Map<String, dynamic> toJson() => {
        "id": id,
        "product": product,
        "quantity": quantity,
      };
}
