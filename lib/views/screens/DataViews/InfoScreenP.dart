import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../models/password_model.dart';
import '../Settings.dart';

class PasswordInfoScreen extends StatefulWidget {
  final PasswordModel password;

  const PasswordInfoScreen({Key? key, required this.password}) : super(key: key);

  @override
  _PasswordInfoScreenState createState() => _PasswordInfoScreenState();
}

class _PasswordInfoScreenState extends State<PasswordInfoScreen> {
  bool obscurePassword = false;

  void _togglePasswordVisibility() {
    setState(() {
      obscurePassword = !obscurePassword;
    });
  }

  void _copyToClipboard(String label, String value) {
    Clipboard.setData(ClipboardData(text: value));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$label copied')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pass = widget.password;

    return Scaffold(
      appBar: AppBar(
        title: Text("Password Details"),
        backgroundColor: Colors.cyan,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Top container for branding
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.cyan, Colors.teal],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.cyan.withAlpha(200),
                    blurRadius: 15,
                    offset: Offset(0, 5),
                  )
                ],
              ),
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text("Website:",
                        style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.web, color: Colors.white),
                      SizedBox(width: 10),
                      Text(
                        pass.website,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Username field
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Username"),
              subtitle: Text(pass.username, style: TextStyle(fontWeight: FontWeight.bold)),
              trailing: IconButton(
                icon: Icon(Icons.copy),
                onPressed: () async {
                 if(await BiometricPassed()) {
                    _copyToClipboard("Username", pass.username);
                  }
                },
              ),
            ),

            // Email field
            ListTile(
              leading: Icon(Icons.email),
              title: Text("Email"),
              subtitle: Text(pass.email, style: TextStyle(fontWeight: FontWeight.bold)),
              trailing: IconButton(
                icon: Icon(Icons.copy),
                onPressed: () async {
                  if(await BiometricPassed()) {
                      _copyToClipboard("Email", pass.email);
                    }
                  }
              ),
            ),

            // Password field
            ListTile(
              leading: Icon(Icons.vpn_key),
              title: Text("Password"),
              subtitle: Text(
                obscurePassword ? pass.password : "••••••••••",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(obscurePassword ? Icons.visibility_off : Icons.visibility),
                    onPressed: ()async {
                     if(!obscurePassword) {
                          if (await BiometricPassed()) {
                            _togglePasswordVisibility();
                          }
                        }else{
                       setState((){
                         _togglePasswordVisibility();
                       });
                     }
                      }
                  ),
                  IconButton(
                    icon: Icon(Icons.copy),
                    onPressed: () async {
                     if(await BiometricPassed()) {
                          _copyToClipboard("Password", pass.password);
                        }
                      }
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
