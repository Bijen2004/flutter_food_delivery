import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          children: [
            Icon(Icons.lock_open_rounded,size: 100,color: Theme.of(context).colorScheme.inversePrimary),
            const SizedBox(height: 25,),
            TextField()
          ],
        ),
      ),
    );
  }
}
