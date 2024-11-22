import 'package:cached_image/cached_network_image.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'cached_network_image',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const CachedImage(),
    );
  }
}
