import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_screen/configs/mycolors.dart';

import '../../utils/register.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign Up',
          style: TextStyle(fontFamily: 'Anurati'),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg.png'),
              fit: BoxFit.cover,
            ),
          ),
          padding: EdgeInsets.all(20),
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  backgroundImage: AssetImage('assets/images/user.png'),
                  radius: 40,
                ),
                SizedBox(height: 20),
                Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.cyan,
                    fontFamily: 'Anurati',
                  ),
                ),
                SizedBox(height: 20),


                // Username Field
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    controller: usernameController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Username',
                      prefixIcon: Icon(Icons.person_outline,color: Colors.white),
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                SizedBox(height: 10),

                // Email Field
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    controller: emailController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Email',
                      prefixIcon: Icon(Icons.email,color: Colors.white),
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                SizedBox(height: 10),

                // Password Field
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.white),
                      prefixIcon: Icon(Icons.lock,color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 10),

                // Confirm Password Field
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    controller: confirmPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Confirm Password',
                      hintStyle: TextStyle(color: Colors.white),
                      prefixIcon: Icon(Icons.lock_outlined,color: Colors.white,),
                    ),
                  ),
                ),
                SizedBox(height: 15),

                // Sign Up Button
                ElevatedButton.icon(
                  onPressed: () async {
                    String username = usernameController.text.trim();
                    String email = emailController.text.trim();
                    String password = passwordController.text.trim();
                    String confirmPassword = confirmPasswordController.text.trim();

                    if (password.isEmpty || confirmPassword.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Please fill in both password fields")),
                      );
                    } else if (password != confirmPassword) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Passwords do not match")),
                      );
                    } else {
                      bool isRegistered = await registerUser(username, email, password);

                      if (isRegistered == true) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Signup successful! Welcome!")),
                        );

                        Get.offAndToNamed("/home");
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Signup failed. Try again.")),
                        );
                      }
                    }
                  },

                  icon: Icon(Icons.person_add),
                  label: Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                ),
                SizedBox(height: 10),


                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account?',style: TextStyle(color: Colors.grey,),),
                    TextButton(
                      onPressed: () {
                        Get.offAndToNamed("/login");
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
  }
}
