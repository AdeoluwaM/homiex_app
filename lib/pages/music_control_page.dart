import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MusicControlPage extends StatefulWidget {
  const MusicControlPage({super.key, required this.title});

  final String title;
  

  @override
  State<MusicControlPage> createState() => _MusicControlPageState();
}

class _MusicControlPageState extends State<MusicControlPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}