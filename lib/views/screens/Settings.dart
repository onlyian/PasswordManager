import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    bool isSwitched =false;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(onPressed: (){},
            icon: Icon(Icons.arrow_back_rounded)),

        title: Text('Settings',
          style: TextStyle(fontFamily: 'Anurati'),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
      ),

      body: Column(
               children: [
                 ListTile(
                   leading: Icon(Icons.fingerprint),
                   title: Text("Require biometric",style: TextStyle(fontWeight: FontWeight.w500),),
                   subtitle: Padding( padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                       child:  Text("Use biometric authentication to access sensitive information")),
                   trailing: Switch(value: isSwitched, onChanged: (value){}),
                 ),
                 // ListTile(
                 //   leading: Icon(Icons.location_on_rounded),
                 //   trailing: Icon(Icons.location_on_rounded),
                 //   title: Icon(Icons.brush_rounded),
                 //   subtitle: Icon(Icons.brush_rounded),
                 // ),
                 ListTile(
                   leading: Icon(Icons.brush_rounded),
                   title: Text("Theme",style: TextStyle(fontWeight: FontWeight.w500),),
                   subtitle: Text("Toggle app theme"),
                   trailing: Switch(value: isSwitched, onChanged: (value){}),
                 ),

               ],
             ),

    );
  }
}