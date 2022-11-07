
// an Email class object has all the extracted and stored data
import 'package:google_sign_in/google_sign_in.dart';

class Email {
  dynamic email_id;
  String? userName;
  String? userEmail;
  GoogleIdentity? userImage;
  String? from;
  String? sender_name;
  String? sender_email;
  String? date;
  String? day;
  String? subject;
  String? body;
  String? decoded_body;

  Email(
      {this.email_id,
      this.userName,
      this.userEmail,
      this.userImage,
      this.from,
      this.sender_name,
      this.sender_email,
      this.date,
      this.day,
      this.subject,
      this.body,
      this.decoded_body});
}
