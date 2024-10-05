import 'package:flutter/material.dart';
import 'package:food_delivery/components/app_button.dart';
import 'package:food_delivery/components/app_textfield.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.lock_open_rounded,size: 100,color: Theme.of(context).colorScheme.inversePrimary),
            const SizedBox(height: 25,),
            AppTextfield(controller: emailController, hintText: 'Enter Email', obscureText: false),
            const SizedBox(height: 10,),
            AppTextfield(controller: passwordController, hintText: 'Enter Password', obscureText: true),
            const SizedBox(height: 10,),
            AppTextfield(controller: confirmPasswordController, hintText: 'Retype Password', obscureText: true),
            const SizedBox(height: 10,),
            AppButton(text: 'Register account', onTap: (){},),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account ? Go to ",
                  style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
                ),
                const SizedBox(width: 4,),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    'Login Page',
                    style: TextStyle(
                        color: Colors.red[300],
                        fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
