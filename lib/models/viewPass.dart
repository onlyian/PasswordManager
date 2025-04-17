import 'package:flutter/material.dart';
import '../utils/savePass.dart';

void showPasswordBottomSheet(BuildContext context) {
  final websiteController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 15,
          right: 15,
          top: 20,
        ),
        child: StatefulBuilder(
          builder: (context, setState) {
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 50,
                    height: 5,
                    decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Enter Logins",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),

                  // TextFields
                  _buildTextField("Website", Icons.web, websiteController),
                  _buildTextField("Username", Icons.person, usernameController),
                  _buildTextField("Email", Icons.email, emailController),
                  _buildTextField("Password", Icons.lock, passwordController, isPassword: true),

                  SizedBox(height: 30),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Cancel"),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.cyan),
                        onPressed: () async {
                          final website = websiteController.text.trim();
                          final username = usernameController.text.trim();
                          final email = emailController.text.trim();
                          final password = passwordController.text.trim();

                          if (website.isEmpty || username.isEmpty || email.isEmpty || password.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Please fill all fields.")),
                            );
                            return;
                          }

                          final saved = await insertPassword(
                              website, username, email, password);

                          if (context.mounted) {
                            Navigator.pop(context); // Close bottom sheet

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(saved
                                      ? "Save successful!"
                                      : "Save failed. Try again.")),
                            );
                          }
                        },
                        child: Text("Save"),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                ],
              ),
            );
          },
        ),
      );
    },
  ).whenComplete(() {
    // Clean up controllers when bottom sheet closes
    websiteController.dispose();
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  });
}
Widget _buildTextField(String label, IconData icon, TextEditingController controller, {bool isPassword = false}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: TextFormField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.grey),
        filled: true,
        fillColor: Color.fromARGB(247, 232, 235, 237),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none),
      ),
    ),
  );
}
