import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier {
  int _selectedPage = 0;

  get pageSelected => _selectedPage;

  set setPageSeleted(int value) {
    _selectedPage = value;
    notifyListeners();
  }
}
