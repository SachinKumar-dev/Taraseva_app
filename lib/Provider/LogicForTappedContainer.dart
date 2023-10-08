import 'package:flutter/material.dart';
class LogicContainer extends ChangeNotifier {
  var tappedContainerIndex = -1;
  void handleTap(int index) {
    tappedContainerIndex = index;
    notifyListeners();
  }
}