import 'package:flutter/material.dart';
import 'package:qr_scaner_example/screens/scaner_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR example APP'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ScanerPage(),
              ),
            );
          },
          child: const Text('Open scaner'),
        ),
      ),
    );
  }
}
