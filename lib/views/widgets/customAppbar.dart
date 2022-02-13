import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  final String title;

  CustomAppBar(
    this.title, {
    Key? key,
  })  : preferredSize = const Size.fromHeight(50.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const BackButton(),
      title: Text(
        title,
        style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
      ),
      backgroundColor: Theme.of(context).primaryColorDark,
      elevation: 0.0,
      automaticallyImplyLeading: true,
    );
  }
}
