import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  final String email;

  const ProfileScreen({super.key, required this.email});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = isDarkMode ? Colors.black : Colors.grey[100]!;
    Color textColor = isDarkMode ? Colors.white : Colors.black;
    Color subtitleColor = isDarkMode ? Colors.grey[300]! : Colors.grey;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: const Color.fromARGB(255, 90, 3, 116),
        actions: [
          Switch(
            value: isDarkMode,
            onChanged: (val) {
              setState(() {
                isDarkMode = val;
              });
            },
            activeColor: Colors.white,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('build/images/profile-placeholder.png'),
              backgroundColor: Colors.white,
            ),
            const SizedBox(height: 20),
            Text(
              widget.email,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: textColor),
            ),
            const SizedBox(height: 8),
            Text(
              "Flutter Developer",
              style: TextStyle(fontSize: 16, color: subtitleColor),
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.email, color: textColor),
              title: Text("Email", style: TextStyle(color: textColor)),
              subtitle: Text(widget.email, style: TextStyle(color: subtitleColor)),
            ),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.logout),
              label: const Text("Logout"),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 54, 67, 244),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
