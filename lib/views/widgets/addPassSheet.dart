import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_screen/controllers/password_controller.dart';
import '../../utils/savePass.dart';
import 'MyTextField.dart';

final PasswordController passwordControllerF = Get.find<PasswordController>();

void showPasswordBottomSheet(
    BuildContext context,
    TextEditingController websiteController,
    TextEditingController usernameController,
    TextEditingController emailController,
    TextEditingController passwordController,
    ) {


  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.fromLTRB(15, 20, 15, MediaQuery.of(context).viewInsets.bottom,),
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
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Enter Logins",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),

                  MyTextField("Website", Icons.web, websiteController),
                  MyTextField("Username", Icons.person, usernameController),
                  MyTextField("Email", Icons.email, emailController),
                  MyTextField("Password", Icons.lock, passwordController, isPassword: true),

                  SizedBox(height: 30),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          websiteController.clear();
                          usernameController.clear();
                          emailController.clear();
                          passwordController.clear();
                        },
                        child: Text("Cancel", style: TextStyle(fontSize: 16)),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.cyan,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () async {
                          FocusScope.of(context).unfocus();

                          final website = websiteController.text.trim();
                          final username = usernameController.text.trim();
                          final email = emailController.text.trim();
                          final password = passwordController.text.trim();

                          if (website.isEmpty || username.isEmpty || email.isEmpty || password.isEmpty) {
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Please fill all fields.")),
                              );
                            }
                            return;
                          }

                          final saved = await insertPassword(website, username, email, password);

                          if (context.mounted) {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(saved ? "Save successful!" : "Save failed. Try again.")),
                            );
                            passwordControllerF.fetchPasswords();
                            websiteController.clear();
                            usernameController.clear();
                            emailController.clear();
                            passwordController.clear();
                          }
                        },
                        child: Text(" Save ", style: TextStyle(fontSize: 18)),
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
  );
}

