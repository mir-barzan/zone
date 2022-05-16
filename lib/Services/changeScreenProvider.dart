import 'package:flutter/material.dart';

class ChangeScreenProvider extends ChangeNotifier{
  int _index = 0;
  getAndSetIndex(x){
    _index = x;
    return _index;

  }
  getIndex(){
    return _index;
  }

}