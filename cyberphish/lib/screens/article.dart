// ignore_for_file: prefer_const_constructors, sort_child_properties_last, deprecated_member_use

import 'package:cyberphish/model/article.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key, required this.object});
  final article? object;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.arrow_back_ios_rounded),
              onPressed: () {
                Navigator.pop(context);
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        centerTitle: true,
      ),
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
                      padding:
                          EdgeInsets.only(left: 20.0, right: 20.0, bottom: 56),
                      height: size.height * 0.2 - 27,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(36),
                          bottomRight: Radius.circular(36),
                        ),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Article",
                            style:
                                Theme.of(context).textTheme.headline5?.copyWith(
                                      color: Colors.white,
                                      fontFamily: "Quicksand-LightItalic",
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          Spacer(),
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "By: ${object?.author}\n",
                                    style: TextStyle(
                                      fontFamily: 'Quicksand-Regular',
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Click here for the full article",
                                    style: TextStyle(
                                      fontFamily: "Quicksand-Medium",
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        launch('${object?.link}');
                                      },
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 6.h, horizontal: 10.w),
                    margin: EdgeInsets.only(
                        bottom: 3.h, left: 3.w, right: 3.w, top: 5.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: 5.h,
                            right: 5.w,
                          ),
                        ),
                        Flexible(
                          child: Container(
                            margin: EdgeInsets.only(
                              bottom: 5.h,
                            ),
                            padding: EdgeInsets.only(
                              top: 30.h,
                              left: 10.w,
                              right: 20.w,
                              bottom: 30.h,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 0.h, bottom: 0.h, left: 7.w),
                                  child: Text(object?.title ?? '',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        height: 1,
                                        fontFamily: 'Quicksand-Italic',
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.deepPurple,
                                      )),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(58, 248, 248, 248),
                              borderRadius: BorderRadius.circular(20.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 248, 248, 248)
                                      .withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: Offset(
                                      -1, -1), // changes position of shadow
                                ),
                                BoxShadow(
                                  color: Color.fromARGB(255, 248, 248, 248)
                                      .withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: Offset(
                                      1, 1), // changes position of shadow
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 6.h, horizontal: 10.w),
                    margin: EdgeInsets.only(
                        bottom: 3.h, left: 3.w, right: 3.w, top: 5.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: 5.h,
                            right: 5.w,
                          ),
                        ),
                        Flexible(
                          child: Container(
                            margin: EdgeInsets.only(
                              bottom: 5.h,
                            ),
                            padding: EdgeInsets.only(
                              top: 30.h,
                              left: 10.w,
                              right: 20.w,
                              bottom: 30.h,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 9.h, bottom: 10.h, left: 7.w),
                                  child: Text(object?.content ?? '',
                                      style: TextStyle(
                                        //overflow: TextOverflow.ellipsis,
                                        height: 1.7,
                                        fontFamily: 'Quicksand-Regular',
                                        fontSize: 16.sp,
                                      ) //fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(58, 248, 248, 248),
                              borderRadius: BorderRadius.circular(20.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 248, 248, 248)
                                      .withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: Offset(
                                      -1, -1), // changes position of shadow
                                ),
                                BoxShadow(
                                  color: Color.fromARGB(255, 248, 248, 248)
                                      .withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: Offset(
                                      1, 1), // changes position of shadow
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 1.sh - size.height,
                  ),
                ],
              ),
            ],
          ),
          decoration: BoxDecoration(
            //color: Colors.white,
            image: DecorationImage(
              image: AssetImage("assets/images/background2.jpg"),
              fit: BoxFit.cover,
            ),
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
