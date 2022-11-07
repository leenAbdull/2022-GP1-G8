import 'dart:convert';
import 'package:cyberphish/model/article.dart';
import 'package:cyberphish/model/email.dart';
import 'package:cyberphish/screens/NavBar.dart';
import 'package:cyberphish/screens/loading.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginViewModel extends ChangeNotifier {
  //attributes
  final firestore = FirebaseFirestore.instance;
  List<Email> emailsList = [];
  List<article> articleList = [];
  GoogleSignInAccount? currentUser;
  var headers;
  var email_id;
  var email_messages;
  int count = 0;
  String response_API = '';
  String sender_name = '';
  String sender_email = '';
  String from = '';
  String date = '';
  String day = '';
  String subject = '';
  String body = '';
  String decoded_body = '';
  var startIndex;
  var endIndex;

// instance of GoogleSignIn that allows us to use google sign in and sign out
  GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
      'https://mail.google.com/', // scope that has full access
    ],
  );

  // handle get content method,retrieved from DB
  handleGetContent() async {
    final awareness = FirebaseFirestore.instance.collection('Awareness');
    final articles = await awareness.get();
    for (var articleData in articles.docs) {
      articleList.add(
        // add an article to the list, using the article class
        article(
            title: articleData.data()['title'],
            author: articleData.data()['author'],
            link: articleData.data()['link'],
            content: articleData.data()['content'],
            imgLink: articleData.data()['imgLink']),
      );
    }
    return articleList;
  }

  // handle sign out, empty the email list, return the user to log in screen
  handleSignOut() async {
    await googleSignIn.signOut();
    emailsList = [];
    Get.offAll(() => LoginScreen());
  }

  // sign in method, that handle sign in through Gmail, send the user to handle get email method
  handleSignIn() async {
    try {
      // retrieve user's google account, store user's account in DB in user collection
      currentUser = await googleSignIn.signIn();
      firestore.collection("GoogleSignInAccount").doc(currentUser!.id).set({
        "displayName": currentUser!.displayName,
        'email': currentUser!.email,
        'user_id': currentUser!.id,
        'photoUrl': currentUser!.photoUrl,
        'serverAuthCode': currentUser!.serverAuthCode,
      });
      await handleGetEmail(currentUser!);
      await handleGetContent();

      Get.to(
        () => NavBar(
          user: currentUser!,
          emailsList: emailsList,
          articleList: articleList,
        ),
      );
    } catch (error) {
      print(error);
    }
  }

  // handle get email method, send request to Gmail API
  handleGetEmail(GoogleSignInAccount user) async {
    final http.Response getProfile = await http.get(
      // send get request to get the last 100 emails from user inbox
      Uri.parse(
          'https://gmail.googleapis.com/gmail/v1/users/${user.id}/messages/'),
      headers: await user.authHeaders,
    );
    if (getProfile.statusCode != 200) {
      response_API = 'Gmail API  a ${getProfile.statusCode} '
          'response. Check logs for details.';
      Text(response_API);
      notifyListeners();
      return;
    } else {
      Get.to(
        // go to loading screen while the emails are downloading
        () => LoadingScreen(),
      );

      //in successful getProfile request state:
      // decode the json response, contain the last 100 email id
      final Map<String, dynamic> allEmailsResponse =
          json.decode(getProfile.body) as Map<String, dynamic>;

      // send post watch request, to monitor any changes on user Gmail account
      // using this request via sub/pub API and Gmail API
      final http.Response watchRequest = await http.post(
          Uri.parse(
              'https://gmail.googleapis.com/gmail/v1/users/${user.id}/watch'),
          headers: await user.authHeaders,
          body: jsonEncode(<String, String>{
            "topicName": 'projects/cyberphish-gp/topics/cyberphish'
          }));

      // decode the json response, contain the history id
      final Map<String, dynamic> watchResponse =
          json.decode(watchRequest.body) as Map<String, dynamic>;

      //extract the history id, to use as parameter in the history request query parameter
      final historyId = watchResponse['historyId'];

      // send get request to get any new changes and updates on the Gmail account
      final http.Response historyRequest = await http.get(
        Uri.parse(
            'https://gmail.googleapis.com/gmail/v1/users/${user.id}/history?startHistoryId=${historyId}'),
        headers: await user.authHeaders,
      );
      // decode the json response, contain the new changes
      final Map<String, dynamic> historyResponse =
          json.decode(historyRequest.body) as Map<String, dynamic>;

      // get the messages of the response, contain  email's id and email's thread for the latest 100 email
      email_messages = allEmailsResponse['messages'];
      // if no emails, Get the awareness content and redirect to NavBar, which redirect the Home Page
      if (email_messages == null) {
        handleGetContent();
        Get.to(
          () => NavBar(
            user: currentUser!,
            emailsList: emailsList,
            articleList: articleList,
          ),
        );
      }
      // loop on the emails, count how many recieved emails
      for (var email in email_messages) {
        count++;
      }
      // if the emails above 50, extract the last 50
      if (count > 50) {
        count = 50;
      }
      //loop on to get the emails data
      for (var i = 0; i < 20; i++) {
        // extract the current email id
        email_id = allEmailsResponse['messages'][i]['id'].toString();
        // send  get request to retrive specific email data using the email id
        final http.Response emailData = await http.get(
          Uri.parse(
              'https://gmail.googleapis.com/gmail/v1/users/${user.id}/messages/${email_id}'),
          headers: await user.authHeaders,
        );
        //decode the response, the response has all single email data, as 7 nested array, 100 fields of data
        final Map<String, dynamic> emailDataResponse =
            json.decode(emailData.body) as Map<String, dynamic>;

        // extract the headers contains all the header info such as sender, date, day, subject using loop through it
        headers = emailDataResponse['payload']['headers'];
        for (var i = 0; i < headers.length; i++) {
          // check if the current header is the From
          if (emailDataResponse['payload']['headers'][i]['name'] == 'From') {
            from = emailDataResponse['payload']['headers'][i]['value'];
            startIndex = from.indexOf("<", 0);
            endIndex = from.indexOf(">", 0);
            // substring the sender name, and sender email
            sender_email = from.substring(startIndex + 1, endIndex);
            sender_name = from.substring(0, startIndex);
          }
          // check if the current header is the Date, substring the day from the date
          if (emailDataResponse['payload']['headers'][i]['name'] == 'Date') {
            date = emailDataResponse['payload']['headers'][i]['value'];
            day = date.substring(0, 3); // substring the day
          }
          // check if the current header is the subject and extract the subject
          if (emailDataResponse['payload']['headers'][i]['name'] == 'Subject') {
            subject = emailDataResponse['payload']['headers'][i]['value'];
          }
        }
        // check if the body has size, it is either in the first path or the second
        if (emailDataResponse['payload']['body']['size'] > 0) {
          body = emailDataResponse['payload']['body']['data'];
        } else if (emailDataResponse['payload']['parts'][0]['body']['data'] !=
            null) {
          body = emailDataResponse['payload']['parts'][0]['body']['data'];
        } else {
          body = ""; // no body found

        }
        // decode the body from base64 to utf-8
        if (body != "") {
          decoded_body = utf8.decode(base64.decode(body));
        } else {
          decoded_body = "no body found";
        }
        // add an email to the emailsList, using the email class
        emailsList.add(
          Email(
            email_id: email_id,
            userName: user.displayName,
            userEmail: user.email,
            userImage: user,
            from: from,
            sender_name: sender_name,
            sender_email: sender_email,
            date: date,
            day: day,
            subject: subject,
            body: body,
            decoded_body: decoded_body,
          ),
        );
        // add the email to user's collection inside the email's collection
        firestore
            .collection("GoogleSignInAccount")
            .doc(currentUser!.id)
            .collection("emailsList")
            .doc(email_id)
            .set({
          'email_id': email_id,
          'from': from,
          'sender_name': sender_name,
          'sender_email': sender_email,
          'date': date,
          'day': day,
          'subject': subject,
          'body': decoded_body,
        });

        notifyListeners();
      }
      // navigate to NavBar --> redirect to home page
      Get.to(
        () => NavBar(
          user: currentUser!,
          emailsList: emailsList,
          articleList: articleList,
        ),
      );
      return emailsList;
    }
  }
}
