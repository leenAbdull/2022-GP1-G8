// ignore_for_file: unused_element, prefer_const_constructors, sort_child_properties_last

// ignore: depend_on_referenced_packages
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 20.0 * 2.5),
                height: size.height * 0.2,
                child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        left: 20.0,
                        right: 20.0,
                        bottom: 56.0,
                      ),
                      height: size.height * 0.2 - 27,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(36),
                          bottomRight: Radius.circular(36),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Report",
                            style:
                                Theme.of(context).textTheme.headline5?.copyWith(
                                      color: Colors.white,
                                      fontFamily: "Quicksand-LightItalic",
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20.0),
                        height: 54,
                        decoration: BoxDecoration(
                          color: Color(0xECFBFBF9),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 10),
                              blurRadius: 50,
                              color: Colors.deepPurple.withOpacity(0.23),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "\"We wish you a safe stay on the internet.\"",
                              style: TextStyle(
                                  fontFamily: "Quicksand-Italic", fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // SizedBox(
              //   height: 1.sh - 440.h,
              // ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const SizedBox(width: 20.0, height: 100.0),
                  const Text(
                    'COMING ',
                    style: TextStyle(fontSize: 33.0),
                  ),
                  const SizedBox(width: 1.0, height: 440.0),
                  DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 30.0,
                      fontFamily: 'Horizon',
                      color: Colors.deepPurple,
                    ),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        RotateAnimatedText('SOON'),
                        RotateAnimatedText('SOON'),
                        RotateAnimatedText('SOON'),
                      ],
                      onTap: () {
                        print("Tap Event");
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background2.jpg"),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 10),
                blurRadius: 50,
                color: Colors.deepPurple
                    .withOpacity(0.23), // changes position of shadow
              ),
              BoxShadow(
                offset: Offset(0, 10),
                blurRadius: 50,
                color: Colors.deepPurple
                    .withOpacity(0.23), // changes position of shadow
              ),
            ],
          ),
        ),
      ),
    );
  }
}
