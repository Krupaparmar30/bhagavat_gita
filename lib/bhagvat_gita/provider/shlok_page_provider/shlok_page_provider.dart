import 'package:flutter/cupertino.dart';

class ShlokPageProvider extends ChangeNotifier{
  String selLan="Sanskrit";
  void languageTranslate(String value)
  {
    selLan=value;
    notifyListeners();
  }
}