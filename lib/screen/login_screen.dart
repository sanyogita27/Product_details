import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:loginform/api/data_fetch.dart';
import 'package:loginform/widget/form_validation.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  void login(String username, password) async {
    try {
      Response response =
          await post(Uri.parse("https://dummyjson.com/auth/login"), body: {
        'username': username,
        'password': password,
      }, headers: {
        "Content-Type": "application/json",
        "Content-Length": "<calculated when request is sent>",
        "Host": "<calculated when request is sent>",
        "User-Agent": "PostmanRuntime/7.32.2",
        "Accept": "*/*",
        "Accept-Encoding": "gzip, deflate, br",
        "Connection": "keep-alive"
      });
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
      

        print("login successfully");
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: username,
              validator: FormValidator.nameValidator,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                prefixIcon: Icon(Icons.person_rounded),
                hintText: "Enter the username",
                labelText: "username",
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: password,
              obscureText: true,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  hintText: "Enter the valid password",
                  labelText: "Password",
                  prefixIcon: Icon(Icons.lock_outline)),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.green),
              child: TextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FetchData()));
                    }
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
