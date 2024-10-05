import 'package:flutter/material.dart';
import 'package:food_delivery/components/app_button.dart';
import 'package:food_delivery/components/app_textfield.dart';

class LoginPage extends StatefulWidget {

  final void Function()? onTap;


  const LoginPage({super.key,required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();

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
            AppButton(text: 'Login', onTap: (){},),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not yet registered ?",
                  style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
                ),
                const SizedBox(width: 4,),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    'Register now',
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
