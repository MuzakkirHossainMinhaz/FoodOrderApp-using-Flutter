import 'package:flutter/material.dart';
import 'package:food_order_app/screen/login_page.dart';
import 'package:food_order_app/screen/sign_up.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key,});

  Widget button({
    required String name,
    required Color color,
    required Color textColor,
    required VoidCallback function,
  }) {
    return SizedBox(
      height: 45,
      width: 280,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) return color;
            return color; // Defer to the widget's default.
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: const BorderSide(color: Colors.green))),
        ),
        onPressed: () {
          function();
        },
        child: Text(
          name,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Expanded(
            child: SizedBox(
              height: 170,
              width: 170,
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Center(
                  child: Image.asset("images/logo.png"),
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "Welcome To KhaiDai",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text(
                        "Order food from our App and",
                        style: TextStyle(fontSize: 15),
                      ),
                      const Text(
                        "Make reservation in real-time",
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                  button(
                    name: 'Login',
                    color: Colors.green,
                    textColor: Colors.white,
                    function: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                  ),
                  button(
                    name: 'SignUp',
                    color: Colors.white,
                    textColor: Colors.green,
                    function: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const SignUp(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
