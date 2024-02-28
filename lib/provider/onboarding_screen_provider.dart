import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class OnboardingProvider extends ChangeNotifier {
  late PageController pageController = PageController();
  bool _isOnboardingShown = false;
  PageController get pageControllers => pageController;

  bool get isOnboardingShown => _isOnboardingShown;

  void setOnboardingShown() {
    _isOnboardingShown = true;
    notifyListeners();
  }

  Future<void> loadOnboardingStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isOnboardingShown = prefs.getBool('onboardingShown') ?? false;
    notifyListeners();
  }





}