import 'package:flutter/material.dart';

class NumbersProvider extends ChangeNotifier {
  List<int> numbers = [1, 2, 3, 4, 5];

  void add() {
    int addNumber = numbers.last;
    numbers.add(addNumber + 1);
    notifyListeners();
  }

  void substract() {
    numbers.removeLast();
    notifyListeners();
  }
}
