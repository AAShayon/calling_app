import 'package:calling_app/provider/onboarding_screen_provider.dart';
import 'package:calling_app/view/landing/homepage.dart';
import 'package:calling_app/view/landing/onboarding_screen/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final obsP = Provider.of<OnboardingProvider>(context, listen: false);
    return FutureBuilder(
        future: obsP.loadOnboardingStatus(),
        builder: (context, snapshot) {
          // if(snapshot.connectionState == ConnectionState.done){
            return  MaterialApp(
              title: 'Calling App',
              theme: ThemeData(
                primarySwatch: Colors.blue
              ),
              home: obsP.isOnboardingShown ? const MyHomePage() : const OnBoardingScreen(),
            );
          // }
    });
  }
}
