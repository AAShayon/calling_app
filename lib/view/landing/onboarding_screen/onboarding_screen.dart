import 'package:calling_app/provider/onboarding_screen_provider.dart';
import 'package:calling_app/utils/constant/image_strings.dart';
import 'package:calling_app/utils/constant/texts.dart';
import 'package:calling_app/view/landing/homepage.dart';
import 'package:calling_app/view/landing/onboarding_screen/widget/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnBoardingScreen extends StatelessWidget {

  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final obsP=Provider.of<OnboardingProvider>(context);
    return Scaffold(
      body: PageView(
        controller: obsP.pageController,
        onPageChanged: (int index){
          if(index == 2){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const MyHomePage()));
          }
        },
        children:  const [
          OnboardingPageAttributes(image: AppImages.onBoardingImage1, title: AppTexts.pageTexts1, discription:AppTexts.discription1),
          OnboardingPageAttributes(image: AppImages.onBoardingImage2, title: AppTexts.pageTexts2, discription:AppTexts.discription2),
          OnboardingPageAttributes(image: AppImages.onBoardingImage3, title: AppTexts.pageTexts3, discription:AppTexts.discription3),
        ],
      ),
    );
  }
}
