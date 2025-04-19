import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../models/address _model.dart';
import '../Settings.dart';


final controller = Get.put(PhoneController());

class AddressInfoScreen extends StatelessWidget {
  final AddressModel address;

  const AddressInfoScreen({Key? key, required this.address}) : super(key: key);

  void copyToClipboard(BuildContext context, String label, String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$label copied')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Address Details"),
        backgroundColor: Colors.cyan,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Gradient Header
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
                      child: Text("City:",
                        style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                      )
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.white),
                      SizedBox(width: 10),
                      Text(
                        address.city,
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

            ListTile(
              leading: Icon(Icons.person),
              title: Text("Name"),
              subtitle: Text(address.name),
              trailing: IconButton(
                icon: Icon(Icons.copy),
                onPressed: () => copyToClipboard(context, "Name", address.name),
              ),
            ),
            ListTile(
              leading: Icon(Icons.business),
              title: Text("Organization"),
              subtitle: Text(address.organization),
              trailing: IconButton(
                icon: Icon(Icons.copy),
                onPressed: () => copyToClipboard(context, "Organization", address.organization),
              ),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text("Phone"),
              subtitle: Obx(() =>Text(controller.showPhone.value ? address.phone : "••••••••••"),),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                          icon: Obx(() => Icon(controller.showPhone.value ? Icons.visibility_off : Icons.visibility),),
                          onPressed: ()async {
                            if (!controller.showPhone.value){
                        if (await BiometricPassed()) {
                          controller.togglePhone();
                        }
                      }else{
                              controller.togglePhone();
                            }
                    },
                        ),
                          IconButton(
                          icon: Icon(Icons.copy),
                          onPressed: () => copyToClipboard(context, "Phone", address.phone)),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.location_city),
              title: Text("Street"),
              subtitle: Text(address.street),
              trailing: IconButton(
                icon: Icon(Icons.copy),
                onPressed: () => copyToClipboard(context, "Street", address.street),
              ),
            ),
            ListTile(
              leading: Icon(Icons.map),
              title: Text("Region"),
              subtitle: Text(address.region),
              trailing: IconButton(
                icon: Icon(Icons.copy),
                onPressed: () => copyToClipboard(context, "Region", address.region),
              ),
            ),
            ListTile(
              leading: Icon(Icons.markunread_mailbox),
              title: Text("Postal Code"),
              subtitle: Text(address.postalCode),
              trailing: IconButton(
                icon: Icon(Icons.copy),
                onPressed: () => copyToClipboard(context, "Postal Code", address.postalCode),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class PhoneController extends GetxController {
  final RxBool showPhone = false.obs;

  void togglePhone() {
    showPhone.value = !showPhone.value;
  }
}