import 'package:flutter/material.dart';

class ActionButton extends StatefulWidget {
  const ActionButton({super.key});

  @override
  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              _incrementCounter();
            },
            child: CircleAvatar(
              backgroundColor: Colors.grey.shade400,
              radius: 15,
              child: const Icon(
                Icons.add,
                color: Colors.green,
              ),
            ),
          ),
          SizedBox(
            height: height * 0.005,
          ),
          Text(
            '$_counter',
            style: const TextStyle(
                color: Colors.green, fontSize: 21, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: height * 0.005,
          ),
          InkWell(
            onTap: () {
              _decrementCounter();
            },
            child: CircleAvatar(
              backgroundColor: Colors.grey.shade400,
              radius: 15,
              child: const Icon(
                Icons.remove,
                color: Colors.green,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
