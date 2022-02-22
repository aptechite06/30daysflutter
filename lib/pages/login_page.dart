import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_firstapp/utils/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  final _formkey = GlobalKey<FormState>();
  moveToHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });

      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                SizedBox(
                  height: 20.0,
                ),
                Image.asset(
                  "assets/images/hey.png",
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Welcome $name",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 32.0),
                  child: Column(
                    children: [
                      TextFormField(
                          decoration: InputDecoration(
                            hintText: "Enter UserName",
                            labelText: "User Name",
                          ),
                          validator: (value) {
                            if (value!.isNotEmpty) {
                              return null;
                            } else {
                              return "Username Could not be Empty";
                            }
                          },
                          onChanged: (value) {
                            name = value;
                            setState(() {});
                          }),
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: "Enter Password", labelText: "Password"),
                        obscureText: true,
                        validator: (value) {
                          if (value!.isNotEmpty) {
                            return null;
                          } else if (value.length < 6) {
                            return "Password length must be atleast 6";
                          } else {
                            return "Password could not be Empty";
                          }
                        },
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Material(
                        color: changeButton ? Colors.green : Colors.deepPurple,
                        borderRadius: changeButton
                            ? BorderRadius.circular(50)
                            : BorderRadius.circular(8),
                        child: InkWell(
                          onTap: () => moveToHome(context),
                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            width: changeButton ? 50 : 150,
                            height: 50,
                            alignment: Alignment.center,
                            child: changeButton
                                ? Icon(Icons.done, color: Colors.white)
                                : Text(
                                    "Login",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
