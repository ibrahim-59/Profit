import 'package:flutter/material.dart';

class RecipePage extends StatelessWidget {
  final url;
  const RecipePage({this.url});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:SafeArea(
        child: Text('loading'),
      ),
    );
}}
