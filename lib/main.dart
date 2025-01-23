import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String title = 'BoxShadow Impeller iOS Glitch';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: const ExamplePage(title: title),
    );
  }
}

class ExamplePage extends StatelessWidget {
  const ExamplePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(24),
        itemCount: 5,
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemBuilder: (_, int index) =>
            ExampleRow(imageUrl: 'https://picsum.photos/80/60?image=$index'),
      ),
    );
  }
}

class ExampleRow extends StatelessWidget {
  const ExampleRow({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      clipBehavior: Clip.antiAlias,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(0, 0, 0, 0.4),
        ),
        child: Align(
          alignment: Alignment.center,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: Offset(0, 8),
                  blurRadius: 32,
                  spreadRadius: -40,
                ),
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  offset: Offset(0, 2),
                  blurRadius: 8,
                  spreadRadius: -1,
                ),
              ],
            ),
            child: SizedBox(
              width: 80,
              height: 60,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.network(imageUrl, fit: BoxFit.cover),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
