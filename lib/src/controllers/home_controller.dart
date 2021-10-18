import 'package:flutter/cupertino.dart';

class HomeController with ChangeNotifier {
  bool isRightDoorLocked = true;
  bool isLeftDoorLocked = true;
  bool isBonnetLocked = true;
  bool isTrunkLocked = true;
  int selectedTab = 0;

  void setSelectedTab(int index) {
    selectedTab = index;

    notifyListeners();
  }

  void updateRightDoorLock() {
    isRightDoorLocked = !isRightDoorLocked;
    notifyListeners();
  }

  void updateLeftDoorLock() {
    isLeftDoorLocked = !isLeftDoorLocked;
    notifyListeners();
  }

  void updateBonnetLock() {
    isBonnetLocked = !isBonnetLocked;
    notifyListeners();
  }

  void updateTrunkLock() {
    isTrunkLocked = !isTrunkLocked;
    notifyListeners();
  }
}
