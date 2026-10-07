import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class TvControlPage extends StatefulWidget {
  const TvControlPage({super.key, required this.title});

  final String title;

  @override
  State<TvControlPage> createState() => _TvControlPageState();
}

class _TvControlPageState extends State<TvControlPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}