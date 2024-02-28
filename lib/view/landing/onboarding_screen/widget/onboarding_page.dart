import 'package:calling_app/provider/onboarding_screen_provider.dart';
import 'package:calling_app/view/landing/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingPageAttributes extends StatelessWidget {
  const OnboardingPageAttributes(
      {super.key,
      required this.image,
      required this.title,
      required this.discription});

  final String image;
  final String title;
  final String discription;

  @override
  Widget build(BuildContext context) {
    final obsP=Provider.of<OnboardingProvider>(context);
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 50),
              child: Image.asset(
                image,
                height: 400,
                width: 400,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.brown),
            ),
            const SizedBox(
              height: 58,
            ),
            Text(
              discription,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                if (obsP.pageController.page! < 2) {
                  obsP.setOnboardingShown();
                  obsP.pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                } else {
                  // Save onboarding status in shared preferences
                  SharedPreferences.getInstance().then((prefs) {
                    prefs.setBool('onboardingShown', true);
                  });

                  // Navigate to your main screen or home page
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const MyHomePage(),
                  ));
                }
              },
              child: Text(obsP.pageController.page! < 2 ? 'Next' : 'Finish'),
            )
          ],
        ),
      ),
    );
  }
}
