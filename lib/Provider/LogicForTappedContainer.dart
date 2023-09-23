import 'package:flutter/material.dart';
class LogicContainer with ChangeNotifier {

  var tappedContainerIndex = -1;
  void handleTap(int index) {
    tappedContainerIndex = index;
    notifyListeners();
  }
}