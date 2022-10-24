// ignore_for_file: unnecessary_null_comparison, duplicate_ignore

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_order_app/screen/login_page.dart';
import 'package:food_order_app/widget/text_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool loading = false;
  late UserCredential userCredential;
  final RegExp regExp = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  Future sendData() async {
    try {
      userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email.text, password: password.text);

      await FirebaseFirestore.instance
          .collection('useData')
          .doc(userCredential.user?.uid)
          .set({
        'userid': userCredential.user?.uid,
        'firstName': firstName.text.trim(),
        'lastName': lastName.text.trim(),
        'userName': username.text.trim(),
        'email': email.text.trim(),
        'password': password.text.trim(),
        'confirmPassword': confirmPassword.text.trim(),
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("The password provided is too weak."),
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("The account already exists for that email."),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Faild to login!"),
        ),
      );
      setState(() {
        loading = false;
      });
    }
    setState(() {
      loading = false;
    });
  }

  void validation() {
    // ignore: unnecessary_null_comparison
    if (firstName.text.trim().isEmpty || firstName.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("FirstName is Empty."),
        ),
      );
      return;
    }
    if (lastName.text.trim().isEmpty || lastName.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("LastName is Empty."),
        ),
      );
      return;
    }
    if (username.text.trim().isEmpty || username.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Username is Empty."),
        ),
      );
      return;
    }
    if (email.text.trim().isEmpty || email.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Email is Empty."),
        ),
      );
      return;
    } else if (!regExp.hasMatch(email.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Email is Invalid."),
        ),
      );
      return;
    }
    if (password.text.trim().isEmpty || password.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password is Empty."),
        ),
      );
      return;
    }
    if (confirmPassword.text.trim().isEmpty ||
        confirmPassword.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Confirm Password is Empty."),
        ),
      );
      return;
    } else {
      setState(() {
        loading = true;
      });
      sendData();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Successfully created!"),
        ),
      );      
    }
  }

  Widget button({
    required String name,
    required Color color,
    required Color textColor,
    required VoidCallback ontap,
  }) {
    return SizedBox(
      height: 40,
      width: 130,
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
                  side: BorderSide(color: color))),
        ),
        onPressed: ontap,
        child: Text(
          name,
          style: TextStyle(color: textColor, fontSize: 16),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      backgroundColor: const Color.fromARGB(255, 17, 17, 17),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "Sign Up",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 320,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyTextField(
                      hintText: "First Name",
                      obscureText: false,
                      controller: firstName,
                    ),
                    MyTextField(
                      hintText: "Last Name",
                      obscureText: false,
                      controller: lastName,
                    ),
                    MyTextField(
                      hintText: "Username",
                      obscureText: false,
                      controller: username,
                    ),
                    MyTextField(
                      hintText: "Email",
                      obscureText: false,
                      controller: email,
                    ),
                    MyTextField(
                      hintText: "Password",
                      obscureText: true,
                      controller: password,
                    ),
                    MyTextField(
                      hintText: "Confirm Password",
                      obscureText: true,
                      controller: confirmPassword,
                    ),
                  ],
                ),
              ),
              loading
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const CircularProgressIndicator(),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        button(
                          ontap: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                            );
                          },
                          name: "Cancel",
                          color: Colors.grey,
                          textColor: Colors.black,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        button(
                          ontap: () {
                            validation();
                          },
                          name: "Register",
                          color: Colors.red,
                          textColor: Colors.white,
                        )
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }
}
