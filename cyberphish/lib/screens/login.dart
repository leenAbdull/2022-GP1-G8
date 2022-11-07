// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'custom widget/background_design.dart';
import 'login_viewmodel.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginViewModel(),
      child: Consumer<LoginViewModel>(
        builder: (context, model, child) => Scaffold(
          body: Stack(
            children: [
              BackgroundDesign(),
              Positioned(
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Image.asset(
                      'assets/images/logo-no-background.png',
                      fit: BoxFit.scaleDown,
                    ),
                    MyElevatedButton(
                      width: 300,
                      onPressed: () async {
                        await model.handleSignIn();
                      },
                      borderRadius: BorderRadius.circular(20),
                      child: Text(
                        'Log in using Gmail',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: "Quicksand-Bold"),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "By continuing, you agree to our",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontFamily: "Quicksand-Bold"),
                        ),
                        TextButton(
                          onPressed: () => _dialogBuilder(context),
                          child: const Text(
                            'Privacy Policy',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> _dialogBuilder(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        scrollable: true,
        title: const Text('CyberPhish\'s Privacy Policy: ',
            style: TextStyle(
                color: Colors.black,
                fontFamily: "Quicksand-Bold",
                fontSize: 19)),
        content: RichText(
          text: TextSpan(
            text:
                "CyberPhish Team built the CyberPhish app as a Free app. This service is provided by CyberPhish Team at no cost and is intended for use as is. This page is used to inform visitors regarding our policies with the collection, use, and disclosure of Personal Information. \nIf you choose to use CyberPhish, then you agree to the collection and use of information in relation to this policy.",
            style:
                TextStyle(color: Colors.black, fontFamily: "Quicksand-Regular"),
            children: const <TextSpan>[
              TextSpan(
                text: "\n\nCollection of your personal information: ",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Quicksand-Bold",
                    fontSize: 16),
              ),
              TextSpan(
                text:
                    "\n\nIn order to benefit from our service, CyberPhish require you to provide us with certain personally identifiable information, including but not limited to your logged in Gmail address, Gmail inbox for that account, displayed name and the avatar for that account. Signing in mechanism is handled using ",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Quicksand-Regular",
                ),
              ),
              TextSpan(
                text: "\n• Gmail API\n• Firebase services",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Quicksand-Regular",
                ),
              ),
              TextSpan(
                text: "\n\nUse of your personal information: ",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Quicksand-Bold",
                    fontSize: 16),
              ),
              TextSpan(
                text:
                    "\n\nThe Personal Information that CyberPhish collect is used for delivering and improving the service you have requested. CyberPhish will NOT use or share your information with anyone except as described in this Privacy Policy.",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Quicksand-Regular",
                ),
              ),
              TextSpan(
                text: "\n\nSecurity of Your Personal Data: ",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Quicksand-Bold",
                    fontSize: 16),
              ),
              TextSpan(
                text:
                    "\n\nThe security of Your Personal Data is important to Us, but remember that no method of transmission over the Internet, or method of electronic storage is 100% secure. While We strive to use commercially acceptable means to protect Your Personal Data, We cannot guarantee its absolute security.",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Quicksand-Regular",
                ),
              ),
              TextSpan(
                text:
                    "\n\nDetailed Information on the Processing of Your Personal Data: ",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Quicksand-Bold",
                    fontSize: 16),
              ),
              TextSpan(
                text:
                    "\n\nThe Service Providers We use may have access to Your Personal Data. These third-party vendors collect, store, use, process and transfer information about Your activity on Our Service in accordance with their Privacy Policies.",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Quicksand-Regular",
                ),
              ),
              TextSpan(
                text: "\n\nUsage, Performance and Miscellaneous: ",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Quicksand-Bold",
                    fontSize: 16),
              ),
              TextSpan(
                text:
                    "\n\nWe may use third-party Service Providers to provide better improvement of our Service.\n\n• Gmail API",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Quicksand-Regular",
                ),
              ),
              TextSpan(
                text:
                    "\nTheir Privacy Policy can be viewed at\nhttps://developers.google.com/gmail/api/guides",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Quicksand-Regular",
                  fontSize: 11,
                ),
              ),
              TextSpan(
                text: "\n\n• Google analytic for Firebase",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Quicksand-Regular",
                ),
              ),
              TextSpan(
                text:
                    "\nTheir Privacy Policy can be viewed at \nhttps://firebase.google.com/policies/analytics",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Quicksand-Regular",
                  fontSize: 11,
                ),
              ),
              TextSpan(
                text: "\n\nLinks to Other Sites: ",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Quicksand-Bold",
                    fontSize: 16),
              ),
              TextSpan(
                text:
                    "\n\nCyberPhish may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by me. Therefore, I strongly advise you to review the Privacy Policy of these websites. I have no control over and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services.",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Quicksand-Regular",
                ),
              ),
              TextSpan(
                text: "\n\nContact Us: ",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Quicksand-Bold",
                    fontSize: 16),
              ),
              TextSpan(
                text:
                    "\n\nIf you have any questions or suggestions about CyberPhish Privacy Policy, do not hesitate to contact us at CyberPhish.gp2022@gmail.com.",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Quicksand-Regular",
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('DONE'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

class MyElevatedButton extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double height;
  final Gradient gradient;
  final VoidCallback? onPressed;
  final Widget child;

  const MyElevatedButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.borderRadius,
    this.width,
    this.height = 44.0,
    this.gradient = const LinearGradient(colors: [
      Color.fromARGB(255, 220, 170, 196),
      Color.fromARGB(255, 191, 188, 225)
    ]),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ?? BorderRadius.circular(0);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: borderRadius,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
        child: child,
      ),
    );
  }
}
