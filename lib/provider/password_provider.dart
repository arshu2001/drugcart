import 'package:flutter/cupertino.dart';

class PasswordProvider extends ChangeNotifier{
  bool _checked = true;

  bool get checked => _checked;

  void checking(){
    _checked = !_checked;
    notifyListeners();
  }
}