import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final validCredentials = {"0000@my.com": "0000pass"};

  void validateLogin() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    String message = email.isEmpty
        ? "Please enter your email"
        : password.isEmpty
            ? "Please enter your password"
            : validCredentials[email] == password
                ? "Login successful!"
                : "Incorrect email or password";

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login Page")),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            for (var field in ["Email", "Password"])
              TextField(
                controller:
                    field == "Email" ? emailController : passwordController,
                decoration: InputDecoration(labelText: field),
                obscureText: field == "Password",
                keyboardType: field == "Email"
                    ? TextInputType.emailAddress
                    : TextInputType.text,
              ),
            const SizedBox(height: 40),
            ElevatedButton(
                onPressed: validateLogin, child: const Text("Log-in")),
          ],
        ),
      ),
    );
  }
}
