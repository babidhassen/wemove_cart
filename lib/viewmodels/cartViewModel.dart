import 'package:wemove_cart/models/cartItem.dart';
import 'package:flutter/material.dart';
import '../models/product.dart';
import 'dart:collection';

class CartViewModel extends ChangeNotifier {
  final List<CartItem> _items = <CartItem>[];

  CartViewModel() {
    //Cart Population
    populate();
  }

  UnmodifiableListView<CartItem> get items => UnmodifiableListView(_items);

  void addItem(Product product) {
    var item = CartItem(product: product);
    _items.add(item);
    notifyListeners();
  }

  void deleteItem(int id) {
    _items.removeAt(id);
    notifyListeners();
  }

  void incrementItem(int id) {
    _items[id].quantity++;
    notifyListeners();
  }

  void decrementItem(int id) {
    _items[id].quantity > 1 ? _items[id].quantity-- : deleteItem(id);
    notifyListeners();
  }

  void clearItem() {
    _items.clear();
    notifyListeners();
  }

  int quantity(int id) {
    return _items[id].quantity;
  }

  double get totalPrice {
    double total = 0;
    for (int i = 0; i < _items.length; i++) {
      total += _items[i].quantity * _items[i].product.price;
    }
    return total;
  }

  void populate() {
    addItem(Product(
        id: 1,
        name: 'Seance 1',
        image:
            'https://complete-physio.co.uk/wp-content/uploads/2020/06/7-tips-for-a-successful-return-to-the-gym-after-lockdown-1.jpg',
        price: 10));
    addItem(Product(
        id: 2,
        name: 'Seance 2',
        image:
            'https://complete-physio.co.uk/wp-content/uploads/2020/06/7-tips-for-a-successful-return-to-the-gym-after-lockdown-1.jpg',
        price: 20));
    addItem(Product(
        id: 3,
        name: 'Seance 3',
        image:
            'https://complete-physio.co.uk/wp-content/uploads/2020/06/7-tips-for-a-successful-return-to-the-gym-after-lockdown-1.jpg',
        price: 30));
    addItem(Product(
        id: 4,
        name: 'Seance 4',
        image:
            'https://complete-physio.co.uk/wp-content/uploads/2020/06/7-tips-for-a-successful-return-to-the-gym-after-lockdown-1.jpg',
        price: 40));
    addItem(Product(
        id: 5,
        name: 'Seance 5',
        image:
            'https://complete-physio.co.uk/wp-content/uploads/2020/06/7-tips-for-a-successful-return-to-the-gym-after-lockdown-1.jpg',
        price: 50));
    addItem(Product(
        id: 6,
        name: 'Seance 6',
        image:
            'https://complete-physio.co.uk/wp-content/uploads/2020/06/7-tips-for-a-successful-return-to-the-gym-after-lockdown-1.jpg',
        price: 60));
  }
}
