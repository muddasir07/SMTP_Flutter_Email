import 'package:flutter/material.dart';
import 'package:mailerapp/send_email_function.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SMTP Flutter Email"),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              sendEmail(context);
            },
            child: const Text("Send Email")),
      ),
    );
  }
}
