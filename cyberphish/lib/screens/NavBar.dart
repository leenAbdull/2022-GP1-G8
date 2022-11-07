// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:cyberphish/model/article.dart';
import 'package:cyberphish/model/email.dart';
import 'package:cyberphish/screens/home.dart';
import 'package:cyberphish/screens/login_viewmodel.dart';
import 'package:cyberphish/screens/report.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cyberphish/screens/awareness.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:kommunicate_flutter/kommunicate_flutter.dart';

class NavBar extends StatefulWidget {
  const NavBar(
      {required this.emailsList,
      required this.user,
      required this.articleList,
      Key? key})
      : super(key: key);
  final List<Email> emailsList;
  final List<article> articleList;
  final GoogleSignInAccount user;

  @override
  State<NavBar> createState() => _NavBar();
}

class _NavBar extends State<NavBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> Pages = [
      HomeScreen(emailsList: widget.emailsList, user: widget.user),
      AwarenessContent(
        articleList: widget.articleList,
      ),
      ReportScreen(),
    ];

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.logout_rounded),
              onPressed: () {
                LoginViewModel().handleSignOut();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      body: Center(
        child: Pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        color: Color(0xECFBFBF9),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
            backgroundColor: Color(0xECFBFBF9),
            color: Colors.black,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.deepPurple.shade200,
            gap: 8,
            //onTabChange: (index) => {},
            padding: EdgeInsets.all(16),
            // ignore: prefer_const_literals_to_create_immutables
            tabs: [
              GButton(
                icon: Icons.home,
                text: "home",
              ),
              GButton(
                icon: Icons.book_rounded,
                text: "Awareness",
              ),
              GButton(
                icon: Icons.area_chart,
                text: "report",
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // chat bot button
        onPressed: () async {
          try {
            dynamic conversationObject = {
              'appId':
                  '3b1a0def678f8cccb9c44ea7dd5065d9f', 
            };

            dynamic result = await KommunicateFlutterPlugin.buildConversation(
                    conversationObject)
                .then((clientConversationId) {
              print("Conversation builder success : " +
                  clientConversationId.toString());
            });
          } on Exception catch (e) {
            print("Conversation builder error : " + e.toString());
          }
        },
        backgroundColor: Colors.transparent,
        child: Image.asset("assets/icons/chatbot4.png"),
      ),
    );
  }
}
