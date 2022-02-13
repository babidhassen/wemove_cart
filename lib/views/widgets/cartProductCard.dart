import 'package:flutter/material.dart';
import 'package:wemove_cart/models/cartItem.dart';

class CartProductCard extends StatelessWidget {
  final CartItem cartItem;
  CartProductCard({Key? key, required context, required this.cartItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300.0,
        margin: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 10.0,
        ),
        child: planetCard);
  }

  final planetCard = Container(
    height: 300,
    //margin: const EdgeInsets.only(left: 46.0),
    decoration: BoxDecoration(
      color: const Color(0xFF333366),
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(8.0),
      boxShadow: const <BoxShadow>[
        BoxShadow(
          color: Colors.black12,
          blurRadius: 10.0,
          offset: Offset(0.0, 10.0),
        ),
      ],
    ),
  );
}
