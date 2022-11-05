import 'package:flutter/cupertino.dart';

abstract class TabbarProviderRepo {
  void stateStetTab() {}
}

class TabbarProvider with ChangeNotifier implements TabbarProviderRepo {
  @override
  void stateStetTab() {
    notifyListeners();
  }
}
