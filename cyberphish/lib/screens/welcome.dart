// ignore_for_file: prefer_const_constructors

import 'package:cyberphish/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _WelcomeScreen();
  }
}

class _WelcomeScreen extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    //this is a page decoration for intro screen
    PageDecoration pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 24.0,
        fontFamily: "Quicksand-Bold",
      ),
      titlePadding: EdgeInsets.fromLTRB(
          16.0, 30.0, 16.0, 16.0), //tile font size, weight and color
      bodyTextStyle: TextStyle(
        fontSize: 16.0,
        fontFamily: "Quicksand-Light",
      ), 
      //body text size and color
      //description padding
      imagePadding: EdgeInsets.all(0.0),
    );

    return IntroductionScreen(
      globalBackgroundColor: Color.fromARGB(255, 255, 255, 255),
      //main background of screen
      pages: [
        //set your page view here
        PageViewModel(
          title: "Welcome",
          body: "We are CyberPhish.",
          image: introImage('assets/images/1.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Who are we?",
          body:
              "CyberPhish is a mobile application,\nthat detects phishing in emails.",
          image: introImage('assets/images/2.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Our Goal",
          body:
              "Reduce the risk of the tsunami of\nphishing attacks that threaten your emails.",
          image: introImage('assets/images/3.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Ready to Prevent Phishing?",
          body: "We wish you a safe stay on the internet!",
          image: introImage('assets/images/4.png'),
          decoration: pageDecoration,
        ),
      ],

      onDone: () => goHomepage(context), //go to home page on done
      onSkip: () => goHomepage(context), // You can override on skip
      showSkipButton: true,
      dotsFlex: 3,
      nextFlex: 0,
      skip: Text(
        'Skip',
        style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold),
      ),
      next: Icon(
        Icons.arrow_forward_rounded,
        color: Colors.deepPurple,
      ),
      done: Text(
        'Get started!',
        style: TextStyle(fontWeight: FontWeight.w600, color: Colors.deepPurple),
      ),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0), //size of dots
        color: Colors.deepPurple, //color of dots
        activeSize: Size(22.0, 10.0),
        //activeColor: Colors.white, //color of active dot
        activeShape: RoundedRectangleBorder(
          //shave of active dot
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }

  void goHomepage(context) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) {
      return LoginScreen();
    }), (Route<dynamic> route) => false);
    //Navigate to home page and remove the intro screen history
    //so that "Back" button wont work.
  }

  Widget introImage(String assetName) {
    //widget to show intro image
    return Align(
      alignment: Alignment.bottomCenter,
      child: Image.asset(assetName, width: 300.0),
    );
  }
}
