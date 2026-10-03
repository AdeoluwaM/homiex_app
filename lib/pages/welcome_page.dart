import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:homix/gen/assets.gen.dart';
import 'package:homix/router/app_router.dart';

@RoutePage()
class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  Timer? _timer;

  initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 3), () {
      context.router.replaceAll([SignInRoute()]);
    });
  }


  dispose() {
    _timer?.cancel();
    super.dispose();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          Assets.images.homixLogo.path,
        ),
      ),
    );
  }
}
