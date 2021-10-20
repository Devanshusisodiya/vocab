import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:vocab/constants/api.dart';
import 'package:vocab/views/home.dart';
import 'package:vocab/views/register.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as console;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 150),
        child: AppBar(
          elevation: 10,
          backgroundColor: Colors.purple[700],
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.elliptical(400, 100))),
          flexibleSpace: Center(
              child: Text(
            "Login",
            style: TextStyle(shadows: <Shadow>[
              Shadow(blurRadius: 70, offset: Offset(-5.0, 5.0)),
              Shadow(blurRadius: 70, offset: Offset(5.0, -5.0))
            ], color: Colors.white, fontSize: 60, fontWeight: FontWeight.bold),
          )),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 70),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                child: TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(primary: Colors.purple[800]),
                    child: Text('Login'),

                    // CREATING IMPLICIT FUNCTION BECAUSE EXPLICIT FUNCTIONS NOT WORKING
                    onPressed: () async {
                      var res = await http.post(
                          Uri.parse('http://192.168.43.226:8000/user/login'),
                          headers: <String, String>{
                            'Content-Type': 'application/json'
                          },
                          body: jsonEncode(<String, String>{
                            'username': _usernameController.text,
                            'password': _passwordController.text
                          }));
                      console.log(res.body);
                    }
                    // async {
                    //   // ADD A CONDITIONAL TO PROCESS LOGIN CREDS SERVER SIDE
                    //   var res = await http.post(
                    //       Uri.parse('http://192.168.43.226:8000/user/login'),
                    //       headers: <String, String>{
                    //         'Content-Type': 'application/json'
                    //       },
                    //       body: jsonEncode(<String, dynamic>{
                    //         'username': _usernameController.text,
                    //         'password': _passwordController.text
                    //       }));
                    //   console.log(_usernameController.text);
                    //   if (res.statusCode == 200) {
                    //     SharedPreferences prefs =
                    //         await SharedPreferences.getInstance();
                    //     prefs.setBool('status', true);
                    //     prefs.setString('username', _usernameController.text);
                    //     Navigator.of(context).push(
                    //         MaterialPageRoute(builder: (context) => HomePage()));
                    //   } else {
                    //     _usernameController.clear();
                    //     _passwordController.clear();
                    //     // showDialogBox(context);
                    //   }
                    // },
                    ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text('Don\'t have an account? Try registering.')),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.purple[800]),
                  child: Text('Register'),
                  onPressed: () async {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Register()));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
