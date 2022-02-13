import 'package:flutter/material.dart';

typedef MyIntCallback = dynamic Function(dynamic int);

class MyCustomCounter extends StatefulWidget {
  final MyIntCallback onIncrement;
  final MyIntCallback onDecrement;
  const MyCustomCounter(
      {Key? key, required this.onIncrement, required this.onDecrement})
      : super(key: key);
  @override
  _MyCustomCounterState createState() => _MyCustomCounterState();
}

class _MyCustomCounterState extends State<MyCustomCounter> {
  int _counter = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              color: Colors.blueGrey, borderRadius: BorderRadius.circular(8.0)),
          child: IconButton(
            icon: const Icon(
              Icons.remove,
              color: Colors.white,
            ),
            onPressed: () {
              _counter > 1
                  ? setState(() {
                      _counter--;
                    })
                  : null;
              widget.onDecrement(_counter);
            },
          ),
        ),
        Container(
          width: 10,
        ),
        Text(
          _counter.toString(),
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
        Container(
          width: 10,
        ),
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(8.0)),
          child: IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                _counter++;
              });
              widget.onIncrement(_counter);
            },
          ),
        ),
      ],
    );
  }
}
