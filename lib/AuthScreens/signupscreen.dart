import 'dart:async';

import 'package:designs/services/authservices.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            "assets/images/logo.png",
            height: 50,
            width: 50,
          ),
        ),
        backgroundColor: Colors.black,
        title: Text('Signup'),
      ),
      body: Center(
        child: Container(
          child: Form(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            key: _formKey,
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextFormField(
                  controller: nameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter valid name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintStyle: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w600),
                      hintText: 'Username',
                      border: InputBorder.none),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(height: 15),
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextFormField(
                  controller: emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter valid email';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintStyle: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w600),
                      hintText: 'Email',
                      border: InputBorder.none),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(height: 15),
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextFormField(
                  obscureText: true,
                  controller: passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter a password';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintStyle: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w600),
                      hintText: 'Password',
                      border: InputBorder.none),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 35, 25, 10),
                child: ElevatedButton(
                  onPressed: () {
                    AuthService.signUp(
                        emailController.text, passwordController.text);
                    Timer(Duration(milliseconds: 1000), popNavigator(context));
                  },
                  child: Text("Sign up"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                ),
              ),
              signupBottomTextWidget()
            ],
          )),
        ),
      ),
    );
  }

  popNavigator(BuildContext context) {
    Navigator.pop(context);
  }

  Widget signupBottomTextWidget() {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 35),
      child: RichText(
        text: TextSpan(
            text: "Have an account? ",
            style: TextStyle(color: Colors.grey, fontSize: 18),
            children: <TextSpan>[
              TextSpan(
                  text: 'Log In',
                  style: TextStyle(color: Colors.blue, fontSize: 18),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pop(context);
                    })
            ]),
      ),
    );
  }
}
