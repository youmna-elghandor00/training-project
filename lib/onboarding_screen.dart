import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'auth/login_screen.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});
  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) =>  LoginScreen()),
    );
  }

  Widget _buildImage(String assetName) {
    return Image.asset('assets/images/$assetName', width: 300);
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      pages: [
        PageViewModel(
          title: "Welcome 😀👋",
          body: "Our application will help you complete your daily tasks easily.",
          image: Image.asset('assets/images/onboarding.webp'),
        ),
        PageViewModel(
          title: "Be aware about our products! 👀",
          body: "Everything is broken down into simple steps so you can understand it quickly.",
          image: Image.asset('assets/images/Virtual-Onboarding2.png'),
        ),
        PageViewModel(
          title: "Start your journey! 🚀",
          body: "Click 'Done' and you will enter the application directly.",
          image: Image.asset('assets/images/Employee-Onboarding3.webp'),
        ),
      ],
      onDone: () => _onIntroEnd(context), // لما يخلص
      onSkip: () => _onIntroEnd(context), // لو عمل Skip
      showSkipButton: true,
      skip: const Text("Skip"),
      next: const Icon(Icons.arrow_forward, size: 25,),
      done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator(
        size: Size(8.0, 8.0),
        activeSize: Size(16.0, 8.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}

