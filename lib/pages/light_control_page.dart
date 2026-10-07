import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:homix/components/homix_app_bar.dart';

@RoutePage()
class LightControlPage extends StatefulWidget {
  const LightControlPage({super.key, required this.title});

  final String title;

  @override
  State<LightControlPage> createState() => _LightControlPageState();
}

class _LightControlPageState extends State<LightControlPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomixAppBar(screenName: widget.title),
      body: Column(
        children: [],
      ),
    );
  }
}