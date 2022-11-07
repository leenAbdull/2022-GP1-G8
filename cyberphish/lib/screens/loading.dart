import 'package:flutter/material.dart';
import 'custom widget/background_design.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreen();
}

/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _LoadingScreen extends State<LoadingScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundDesign(),
          Padding(
            padding: const EdgeInsets.all(90.0),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const Text(
                'This won\'t take long, your emails are being loaded',
                style:
                    TextStyle(fontSize: 16, fontFamily: "Quicksand-BoldItalic"),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: SizedBox(
                  width: 300,
                  height: 15,
                  child: LinearProgressIndicator(
                    minHeight: 3,
                    backgroundColor: Color.fromARGB(255, 220, 170, 196),
                    valueColor: new AlwaysStoppedAnimation<Color>(
                        Color.fromARGB(255, 171, 168, 209)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
