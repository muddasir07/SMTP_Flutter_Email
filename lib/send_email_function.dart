
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

sendEmail(BuildContext context //For showing snackbar
    ) async {
  String username = 'abc@gmail.com'; //Your Email
  String password =
      '****************'; // 16 Digits App Password Generated From Google Account

  final smtpServer = gmailSaslXoauth2(username, password);
  // Use the SmtpServer class to configure an SMTP server:
  // final smtpServer = SmtpServer('smtp.domain.com');
  // See the named arguments of SmtpServer for further configuration
  // options.

  // Create our message.
  final message = Message()
        ..from = Address(username, 'Muddasir Shabbir')
        ..recipients.add('muddasir123@mailinator.com')
        // ..ccRecipients.addAll(['abc@gmail.com', 'xyz@gmail.com']) // For Adding Multiple Recipients
        // ..bccRecipients.add(Address('a@gmail.com')) For Binding Carbon Copy of Sent Email
        ..subject = 'Mail from Mailer'
        ..text = 'Hello dear, I am sending you email from Flutter application'
      // ..html = "<h1>Test</h1>\n<p>Hey! Here's some HTML content</p>"; // For Adding Html in email
      // ..attachments = [
      //   FileAttachment(File('image.png'))  //For Adding Attachments
      //     ..location = Location.inline
      //     ..cid = '<myimg@3.141>'
      // ]
      ;

  try {
    final sendReport = await send(message, smtpServer);
    debugPrint('Message sent: $sendReport');
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Mail Send Successfully")));
  } on MailerException catch (e) {
    debugPrint('Message not sent.');
    debugPrint(e.message);
    for (var p in e.problems) {
      debugPrint('Problem: ${p.code}: ${p.msg}');
    }
  }
}
