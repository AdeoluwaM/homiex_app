import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:h_alert_dialog/h_alert_dialog.dart';
import 'package:homix/pages/home_page.dart';

@RoutePage()
class AuthServicesPage extends StatelessWidget {
  const AuthServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              HAlertDialog.showCustomAlertBox(
                  context: context,
                  timerInSeconds: 3,
                  backgroundColor: Colors.redAccent,
                  title: "Error",
                  description: "An error occurred while fetching user data.",
                  icon: Icons.error);
            });
            return const SizedBox.shrink();
          } else if (snapshot.hasData) {
            return HomePage();
          } else {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              HAlertDialog.showCustomAlertBox(
                  context: context,
                  timerInSeconds: 3,
                  backgroundColor: Colors.blueAccent,
                  title: "Not Logged In",
                  description: "Please log in or Register \n to continue.",
                  icon: Icons.info);
            });
            return const SizedBox.shrink();
          }
        });
  }
}
