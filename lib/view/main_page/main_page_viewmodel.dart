import 'package:stacked/stacked.dart';

class MainPageViewmodel extends BaseViewModel {
  int currentIndex = 0;

  void onBottomnavTapped(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
