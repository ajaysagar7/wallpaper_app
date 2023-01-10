import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wallpaper_app_2023/src/pages/signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isObsecuredEnabed = true;
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: const Text("Login Page")),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FlutterLogo(
                  size: size.height * .3,
                ),
                SizedBox(
                  height: size.height * .020,
                ),
                TextFormField(
                  controller: _emailController,
                  textInputAction: TextInputAction.next,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "please enter something";
                    } else if (!val.contains("@")) {
                      return "please enter a valid email";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(
                              color: Colors.blueAccent, width: 2.0)),
                      hintText: "Enter Your Email Address",
                      label: const Text("Email")),
                ),
                SizedBox(
                  height: size.height * 0.020,
                ),
                TextFormField(
                  controller: _passController,
                  obscureText: isObsecuredEnabed,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please enter something";
                    } else if (val.length < 6) {
                      return "password cant be less than 6 charcters";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: isObsecuredEnabed
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility),
                      onPressed: (() {
                        setState(() {
                          isObsecuredEnabed = !isObsecuredEnabed;
                        });
                      }),
                    ),
                    hintText: "Passwrod",
                    label: const Text("Enter you password"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                            color: Colors.blueAccent, width: 2.0)),
                  ),
                ),
                SizedBox(
                  height: size.height * .030,
                ),
                SizedBox(
                    height: size.height * .060,
                    width: size.width * .9,
                    child: ElevatedButton(
                        onPressed: () {
                          _formKey.currentState!.validate()
                              ? Fluttertoast.showToast(msg: "Login Successfull")
                              : Fluttertoast.showToast(msg: "Login Failed");
                        },
                        child: const Text("Login"))),
                SizedBox(
                  height: size.height * 0.040,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an Account?",
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (c) => const SignupPage()));
                        },
                        child: const Text(
                          "Sign up",
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      )),
    ));
  }
}
