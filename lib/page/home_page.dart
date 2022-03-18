import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widget/logged_in_widget.dart';
import '../widget/sign_up_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              return LoggedInWidget();
            } else if (snapshot.hasError) {
              return const Center(
                child: Text(
                  'Something Went Wrong',
                  style: TextStyle(fontSize: 20),
                ),
              );
            } else {
              return SignUpWidget();
            }
          },
        ),
      );
}
