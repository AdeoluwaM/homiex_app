import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:h_alert_dialog/h_alert_dialog.dart';
// import 'package:homix/pages/home_page.dart';
// import 'package:homix/pages/sign_in_page.dart';
import 'package:homix/router/app_router.dart';

// @RoutePage()
// class AuthServicesPage extends StatelessWidget {
//   const AuthServicesPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<User?>(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (context, snapshot) {
//         // Still checking authentication status
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Scaffold(
//             body: Center(
//               child: CircularProgressIndicator(),
//             ),
//           );
//         }

//         // Firebase authentication error
//         if (snapshot.hasError) {
//           return const Scaffold(
//             body: Center(
//               child: Text(
//                 'An error occurred while checking authentication.',
//               ),
//             ),
//           );
//         }

//         // User is logged in
//         if (snapshot.hasData) {
//           return const HomePage();
//         }

//         // User is NOT logged in
//         return SignInPage();
//       },
//     );
//   }
// }


// @RoutePage()
// class AuthServicesPage extends StatefulWidget {
//   const AuthServicesPage({super.key});

//   @override
//   State<AuthServicesPage> createState() => _AuthServicesPageState();
// }

// class _AuthServicesPageState extends State<AuthServicesPage> {
//   bool _hasNavigated = false;

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<User?>(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (context, snapshot) {
//         // Firebase is still checking the authentication state
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Scaffold(
//             body: Center(
//               child: CircularProgressIndicator(),
//             ),
//           );
//         }

//         // Firebase returned an error
//         if (snapshot.hasError) {
//           return const Scaffold(
//             body: Center(
//               child: Text(
//                 'An error occurred while checking authentication.',
//               ),
//             ),
//           );
//         }

//         // User is logged in
//         if (snapshot.hasData) {
//           if (!_hasNavigated) {
//             _hasNavigated = true;

//             WidgetsBinding.instance.addPostFrameCallback((_) {
//               if (!mounted) return;

//               context.router.replace(
//                 const HomeRoute(),
//               );
//             });
//           }

//           return const Scaffold(
//             body: Center(
//               child: CircularProgressIndicator(),
//             ),
//           );
//         }

//         // User is NOT logged in
//         if (!_hasNavigated) {
//           _hasNavigated = true;

//           WidgetsBinding.instance.addPostFrameCallback((_) {
//             if (!mounted) return;

//             context.router.replace(
//                SignInRoute(),
//             );
//           });
//         }

//         return const Scaffold(
//           body: Center(
//             child: CircularProgressIndicator(),
//           ),
//         );
//       },
//     );
//   }
// }



// @RoutePage()
// class AuthServicesPage extends StatefulWidget {
//   const AuthServicesPage({super.key});

//   @override
//   State<AuthServicesPage> createState() => _AuthServicesPageState();
// }

// class _AuthServicesPageState extends State<AuthServicesPage> {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<User?>(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (context, snapshot) {
//         // Firebase is checking the authentication state
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Scaffold(
//             body: Center(
//               child: CircularProgressIndicator(),
//             ),
//           );
//         }

//         // Authentication error
//         if (snapshot.hasError) {
//           return const Scaffold(
//             body: Center(
//               child: Text(
//                 'An error occurred while checking authentication.',
//               ),
//             ),
//           );
//         }

//         // User is logged in
//         if (snapshot.hasData) {
//           WidgetsBinding.instance.addPostFrameCallback((_) {
//             if (!mounted) return;

//             context.router.replaceAll([
//               const HomeRoute(),]
//             );
//           });

//           return const Scaffold(
//             body: Center(
//               child: CircularProgressIndicator(),
//             ),
//           );
//         }

//         // User is NOT logged in
//         WidgetsBinding.instance.addPostFrameCallback((_) {
//           if (!mounted) return;

//           context.router.replace(
//             SignInRoute(),
//           );
//         });

//         return const Scaffold(
//           body: Center(
//             child: CircularProgressIndicator(),
//           ),
//         );
//       },
//     );
//   }
// }


@RoutePage()
class AuthServicesPage extends StatefulWidget {
  const AuthServicesPage({super.key});

  @override
  State<AuthServicesPage> createState() => _AuthServicesPageState();
}

class _AuthServicesPageState extends State<AuthServicesPage> {
  bool _hasCheckedAuth = false;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // Firebase is checking the authentication state
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        // Authentication error
        if (snapshot.hasError) {
          return const Scaffold(
            body: Center(
              child: Text(
                'An error occurred while checking authentication.',
              ),
            ),
          );
        }

        // Prevent this authentication page from
        // navigating repeatedly.
        if (!_hasCheckedAuth) {
          _hasCheckedAuth = true;

          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!mounted) return;

            if (snapshot.hasData) {
              context.router.replace(
                const HomeRoute(),
              );
            } else {
              context.router.replace(
                SignInRoute(),
              );
            }
          });
        }

        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}