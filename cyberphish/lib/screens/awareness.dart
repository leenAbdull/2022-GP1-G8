// ignore_for_file: prefer_const_constructors, must_be_immutable, deprecated_member_use

import 'package:cyberphish/screens/article.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../model/article.dart';

class AwarenessContent extends StatefulWidget {
  const AwarenessContent({required this.articleList, Key? key})
      : super(key: key);
  final List<article> articleList;

  @override
  State<AwarenessContent> createState() => _AwarenessContent();
}

class _AwarenessContent extends State<AwarenessContent> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            //color: Colors.white,
            image: DecorationImage(
              image: AssetImage("assets/images/background2.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          // ignore: sort_child_properties_last
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
                            "Awareness Content",
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
                          // ignore: prefer_const_literals_to_create_immutables
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Container(
                      height: 24,
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              "Articles",
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: "Quicksand-BoldItalic",
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              margin: EdgeInsets.only(right: 5),
                              height: 7,
                              color: Colors.deepPurple.withOpacity(0.2),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("More"),
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 1.sh - 464.h,
                child: ListView.builder(
                  itemCount: widget.articleList.length,
                  itemBuilder: (
                    context,
                    index,
                  ) {
                    return ArticleCards(
                      object: widget.articleList[index],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ArticleCards extends StatelessWidget {
  const ArticleCards({
    Key? key,
    this.object,
  }) : super(key: key);

  final article? object;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Get.to(() => ArticleScreen(object: object),
            duration: Duration(milliseconds: 500),
            transition: Transition.rightToLeftWithFade);
      },
      child: Column(
        children: [
          Container(
            height: 230,
            child: Stack(
              children: [
                Positioned(
                  top: 35,
                  left: 20,
                  child: Material(
                    child: Container(
                      height: 180,
                      width: size.width * 0.9,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(-10, 10),
                            blurRadius: 20,
                            spreadRadius: 4,
                            color: Colors.grey.withOpacity(0.3),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 20,
                  child: Card(
                    elevation: 10,
                    shadowColor: Colors.grey.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Container(
                      height: 200,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage('${object?.imgLink}'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 60,
                  left: 180,
                  child: Container(
                    height: 150,
                    width: 160,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(object?.title ?? '',
                            style: TextStyle(
                              fontFamily: "Quicksand-Medium",
                              fontSize: 18,
                              color: Colors.deepPurple,
                            )),
                        Padding(padding: EdgeInsets.all(3)),
                        Divider(
                          color: Colors.black,
                        ),
                        Padding(padding: EdgeInsets.all(3)),
                        Text(
                          "By: ${object?.author} \n ",
                          style: TextStyle(
                            fontFamily: "Quicksand-Light",
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
