import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GDSC GHRCE',
          style: TextStyle(color: Colors.blue),
        ),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Master flutter with Sahil Banswani'),
      ),
    );
  }
}
