import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0XFF0092B9),
            Color(0XFF0167B2),
          ],
        )),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.png'),
              SizedBox(height: screenSize.height * 0.2),
              SignInButton(
                Buttons.Google,
                onPressed: () {},
                text: 'Continue com o Google',
                padding: const EdgeInsets.all(4),
                shape: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(30)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
