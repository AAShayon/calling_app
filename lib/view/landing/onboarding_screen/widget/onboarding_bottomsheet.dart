import 'package:calling_app/provider/onboarding_screen_provider.dart';
import 'package:calling_app/view/landing/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnBoardingBottomSheet extends StatelessWidget {
  const OnBoardingBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final obsP = Provider.of<OnboardingProvider>(context);
    return Container(
      padding: const EdgeInsets.only(bottom: 50.0, left: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: () {

          }, child: const Text('Next')),
          const SizedBox(width: 50,),
          ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const MyHomePage()));
          }, child: const Text('Skip'))
        ],
      ),
    );
  }
}
