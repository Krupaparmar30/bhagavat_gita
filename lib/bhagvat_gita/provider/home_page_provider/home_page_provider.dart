import 'package:flutter/cupertino.dart';

class HomePageProvider extends ChangeNotifier{
  int lanIndex=0;
  void translateLng()
  {
    if(lanIndex<3)
      {
        lanIndex++;
        notifyListeners();
      }
    else
      {
        notifyListeners();
        lanIndex=0;

      }
  }
}