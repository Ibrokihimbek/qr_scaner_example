import 'package:flutter/material.dart';

class SuccessPage extends StatelessWidget {
  final String barCode;
  const SuccessPage({super.key, required this.barCode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SUCCESS PAGE'),
      ),
      body: Center(
        child: Text(barCode, style: const TextStyle(fontSize: 28,),),
      ),
    );
  }
}
