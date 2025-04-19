import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../controllers/address_controller.dart';
import '../../utils/saveAddress.dart';
import 'MyTextField.dart';

final AddressController addressControllerF = Get.find<AddressController>();

void showAddressBottomSheet(
    BuildContext context,
    TextEditingController nameController,
    TextEditingController orgController,
    TextEditingController phoneController,
    TextEditingController regionController,
    TextEditingController streetController,
    TextEditingController cityController,
    TextEditingController postalController,
    ) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.fromLTRB(15, 20, 15, MediaQuery.of(context).viewInsets.bottom),
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
                    "Enter Address Info",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),

                  MyTextField("Full Name", Icons.person, nameController),
                  MyTextField("Organization", Icons.business, orgController),
                  MyTextField("Phone Number", Icons.phone, phoneController),
                  MyTextField("Region", Icons.map, regionController),
                  MyTextField("Street", Icons.location_on, streetController),
                  MyTextField("City", Icons.location_city, cityController),
                  MyTextField("Postal Code", Icons.markunread_mailbox, postalController),

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
                          nameController.clear();
                          orgController.clear();
                          phoneController.clear();
                          regionController.clear();
                          streetController.clear();
                          cityController.clear();
                          postalController.clear();
                        },
                        child: Text("Cancel", style: TextStyle(fontSize: 16)),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.cyan,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () async{
                          FocusScope.of(context).unfocus();//hide keyboard

                          final name = nameController.text.trim();
                          final org = orgController.text.trim();
                          final phone = phoneController.text.trim();
                          final region = regionController.text.trim();
                          final street = streetController.text.trim();
                          final city = cityController.text.trim();
                          final postal = postalController.text.trim();

                          if (name.isEmpty || region.isEmpty || street.isEmpty || city.isEmpty || postal.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Please fill all required fields.")),
                            );
                            return;
                          }

                          final saved = await insertAddress(name, org, phone, region, street, city, postal);


                            if (context.mounted) {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(saved ? "Address saved successfully!" : "Failed to save address. Try again.")),
                              );
                                  addressControllerF.fetchAddresses();
                                  nameController.clear();
                                  orgController.clear();
                                  phoneController.clear();
                                  regionController.clear();
                                  streetController.clear();
                                  cityController.clear();
                                  postalController.clear();
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
