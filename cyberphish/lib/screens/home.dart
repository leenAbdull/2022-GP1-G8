// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:cyberphish/model/email.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'email Screen/email_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({required this.emailsList, required this.user, Key? key})
      : super(key: key);
  final List<Email> emailsList;
  final GoogleSignInAccount user;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background2.jpg"),
              fit: BoxFit.cover,
            ),
          ),
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
                            widget.user.displayName!,
                            style:
                                Theme.of(context).textTheme.headline5?.copyWith(
                                      color: Colors.white,
                                      fontFamily: "Quicksand-LightItalic",
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          Spacer(),
                          CircleAvatar(
                            radius: 20,
                            backgroundColor:
                                Colors.transparent, 
                            child: GoogleUserCircleAvatar(
                              identity: widget.user,
                            ),
                          ) 
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
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  children: [
                    Container(
                      height: 24,
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              "Inbox",
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
                  ],
                ),
              ),
              SizedBox(
                height: 1.sh - 0.h,
                child: ListView.builder(
                  itemCount: widget.emailsList.length,
                  itemBuilder: (
                    context,
                    index,
                  ) {
                    return MailCard(
                      object: widget.emailsList[index],
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

class MailCard extends StatelessWidget {
  const MailCard({
    Key? key,
    this.object,
  }) : super(key: key);

  final Email? object;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        margin: EdgeInsets.only(
          left: 12.w,
        ),
        padding: EdgeInsets.symmetric(
          vertical: 6.h,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 5.h,
                right: 5.w,
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(() => EmailScreen(object: object),
                    duration: Duration(milliseconds: 500),
                    transition: Transition.rightToLeftWithFade);
              },
              borderRadius: BorderRadius.circular(10.r),
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
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: 9.h, bottom: 10.h, left: 7.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                object?.sender_name ?? '',
                                style: TextStyle(
                                    fontFamily: 'Quicksand-Bold',
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 250.0,
                              ),
                              Text(
                                object?.day ?? '',
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontFamily: 'Quicksand-light',
                                  fontSize: 13.sp,
                                  color: Colors.black,
                                  //fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 5.h, bottom: 10.h, left: 7.w),
                          child: SizedBox(
                            //width: 1.sw / 1.6.w,
                            child: Text(
                              object?.subject ?? '',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: 'Quicksand-Italic',
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp,
                                color: Colors.deepPurple[400],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 5.h, bottom: 10.h, left: 7.w),
                          child: SizedBox(
                            height: 15.h,
                            width: 1.sw / 1.3.w,
                            child: Flexible(
                              child: Text(
                                object?.decoded_body ?? '',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: 'Quicksand-Regular',
                                  fontSize: 13.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(58, 248, 248, 248),
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: [
                    BoxShadow(
                      color:
                          Color.fromARGB(255, 248, 248, 248).withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(-1, -1), // changes position of shadow
                    ),
                    BoxShadow(
                      color:
                          Color.fromARGB(255, 248, 248, 248).withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(1, 1), // changes position of shadow
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
