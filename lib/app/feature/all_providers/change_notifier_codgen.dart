import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// acho que é assim tem q conferir
class CounterChNot extends ChangeNotifier {
  CounterChNot();
  int counter = 0;
  void increment() {
    counter++;
    notifyListeners();
  }
}

final counterChNotProvider =
    ChangeNotifierProvider<CounterChNot>((ref) => CounterChNot());
