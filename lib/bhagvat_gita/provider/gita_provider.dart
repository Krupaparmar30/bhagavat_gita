
import 'dart:convert';

import 'package:bhagavat_gita/bhagvat_gita/modal/gita_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class GitaProvider extends ChangeNotifier{
  List<GitaModal> gitaList=[];
  Future<void> jsonParsing()
  async {
    String json=await rootBundle.loadString('assets/json/gita.json');
    List shlok=jsonDecode(json);
    gitaList = shlok.map((e)=>GitaModal.fromJson(e)).toList();
    notifyListeners();
  }
  GitaProvider()
  {
    jsonParsing();
  }
}