import 'package:clock_app/const/enum.dart';
import 'package:clock_app/model/model_menu.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class NotifierMenu extends ChangeNotifier {

  ModelMenu? menu;

  MenuType get currMenuType => menu?.type ?? MenuType.clock;


  updateMenu(ModelMenu menuNew) {
    menu = menuNew;
    notifyListeners();
  }
}
