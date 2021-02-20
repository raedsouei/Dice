import 'package:flutter/material.dart';
import 'dart:math';

main() {
  runApp(MyDice());
}

class MyDice extends StatefulWidget {
  @override
  _MyDiceState createState() => _MyDiceState();
}

class _MyDiceState extends State<MyDice> {
  Color _backGroundColor = Colors.red;
  int _leftDice = 1;
  int _rightDice = 1;

  void _Move_Dice() {
    _leftDice = Random().nextInt(6) + 1;
    _rightDice = Random().nextInt(6) + 1;
    print(_leftDice);
    print(_rightDice);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: _backGroundColor,
        appBar: AppBar(
          backgroundColor: _backGroundColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'DICE',
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(
                width: 20,
              ),
              Image.asset(
                'assets/dice6.png',
                height: 30,
                width: 30,
              )
            ],
          ),
        ),
        body: Center(
          child: Row(
            children: [
              Expanded(
                  child: Image.asset(
                'assets/dice$_leftDice.png',
              )),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Image.asset(
                'assets/dice$_rightDice.png',
              ))
            ],
          ),
          heightFactor: 2.5,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _Move_Dice();
              if (_rightDice == 6 && _leftDice == 6) {
                _backGroundColor = Colors.green;
              } else {
                _backGroundColor = Colors.red;
              }
            });
          },
          backgroundColor: Colors.amberAccent,
          child: Text(
            'START',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
