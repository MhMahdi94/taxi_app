import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:taxi_application/modules/auth/auth_page.dart';
import 'package:taxi_application/shared/functions.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut().then((value) {
                navigateToWithReplacement(context, AuthPage());
              }).catchError((error) {});
            },
            icon: Icon(Icons.logout_outlined),
          )
        ],
      ),
      body: Center(
        child: Text('AppLayout'),
      ),
    );
  }
}
