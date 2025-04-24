import 'package:flutter/material.dart';
import 'profil_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        toolbarHeight: 38,
        backgroundColor: const Color.fromARGB(255, 90, 3, 116),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const Text(
                'Welcome Back 🥶',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 90, 3, 116)),
              ),
              const SizedBox(height: 12),
              const Text(
                'Sign in to continue',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 40),

              // Email
              _buildInputField(
                label: "Email",
                controller: _emailController,
                hintText: "Enter your email",
                icon: Icons.mail,
              ),
              const SizedBox(height: 20),

              // Password
              _buildInputField(
                label: "Password",
                controller: _passwordController,
                hintText: "Enter your password",
                icon: Icons.lock,
                isPassword: true,
                obscureText: _obscurePassword,
                onSuffixTap: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
              const SizedBox(height: 10),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text("Forgot Password?", style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),

              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: () {
                  final email = _emailController.text.trim();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileScreen(email: email),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 90, 3, 116),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('LOGIN', style: TextStyle(fontSize: 16, letterSpacing: 1)),
              ),

              const SizedBox(height: 20),
              const Text("- OR -", style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSocialIcon('build/images/logo-github.png'),
                  const SizedBox(width: 30),
                  _buildSocialIcon('build/images/Linkedin.png'),
                ],
              ),

              const SizedBox(height: 20),
              RichText(
                text: const TextSpan(
                  style: TextStyle(fontSize: 14, color: Colors.black),
                  children: [
                    TextSpan(text: "Don't have an account? "),
                    TextSpan(
                      text: "Sign Up",
                      style: TextStyle(fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 90, 3, 116)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    bool isPassword = false,
    bool obscureText = false,
    VoidCallback? onSuffixTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: isPassword ? obscureText : false,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Icon(icon),
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
                    onPressed: onSuffixTap,
                  )
                : null,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: const Color.fromARGB(255, 90, 3, 116), width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSocialIcon(String assetPath) {
    return CircleAvatar(
      radius: 20,
      backgroundImage: AssetImage(assetPath),
      backgroundColor: Colors.transparent,
    );
  }
}
