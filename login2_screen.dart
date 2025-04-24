import 'package:flutter/material.dart';

class Login2Screen extends StatefulWidget {
  const Login2Screen({super.key});

  @override
  State<Login2Screen> createState() => _Login2ScreenState();
}

class _Login2ScreenState extends State<Login2Screen> {
  TextEditingController emailController =TextEditingController();
  TextEditingController passwordController =TextEditingController();
bool tampilPassword = true;

showPassword(){
  setState((){
      tampilPassword = !tampilPassword;
    }); 
  }

 @override
Widget build(BuildContext context) {
  return Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Kolom Email
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email",
                hintText: "Masukkan email",
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16), // Spasi antar field
            // Kolom Password (sudah ada sebelumnya)
            TextField(
              obscureText: tampilPassword,
              controller: passwordController,
              decoration: InputDecoration(
                labelText: "Password",
                hintText: "Masukkan password",
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  onPressed: showPassword,
                  icon: Icon(
                    tampilPassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextButton(
              onPressed: showPassword,
              child: Text("Tampil Password"),
            ),
          ],
        ),
      ),
    ),
  );
}
}