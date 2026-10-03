import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:homix/firebase_options.dart';
import 'package:homix/router/app_router.dart';
import 'package:homix/theme/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // print(Firebase.apps);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final appRouter = AppRouter();
    
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Homix App',
      theme: ThemeData(scaffoldBackgroundColor: HomixColors.backgroundColor),
      routerConfig: appRouter.config(),
      // home: SignUpPage(),
    );
  }
}
