import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../controllers/card_controller.dart';
import '../../utils/saveCard.dart';
import 'MyTextField.dart';

final CardController cardControllerF = Get.find<CardController>();

void showCardBottomSheet(
    BuildContext context,
    TextEditingController cardNameController,
    TextEditingController cardholderController,
    TextEditingController cardNumberController,
    TextEditingController brandController,
    TextEditingController expiryMonthController,
    TextEditingController expiryYearController,
    TextEditingController cvvController,
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
                    "Enter Card Info",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),

                  MyTextField("Card Title", Icons.credit_card, cardNameController),
                  MyTextField("Cardholder Name", Icons.person, cardholderController),
                  MyTextField("Card Number", Icons.numbers, cardNumberController),
                  MyTextField("Card Brand", Icons.business, brandController),
                  MyTextField("Expiry Month (1-12)", Icons.calendar_today, expiryMonthController),
                  MyTextField("Expiry Year", Icons.calendar_today, expiryYearController),
                  MyTextField("CVV", Icons.lock, cvvController),

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
                          cardNameController.clear();
                          cardholderController.clear();
                          cardNumberController.clear();
                          brandController.clear();
                          expiryMonthController.clear();
                          expiryYearController.clear();
                          cvvController.clear();
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
                          FocusScope.of(context).unfocus();//hide keyboard

                          final cardname = cardNameController.text.trim();
                          final cardholder = cardholderController.text.trim();
                          final cardnumber = cardNumberController.text.trim();
                          final brand = brandController.text.trim();
                          final expirymonth = expiryMonthController.text.trim();
                          final expiryyear = expiryYearController.text.trim();
                          final cvv = cvvController.text.trim();

                          if (cardname.isEmpty || cardholder.isEmpty || cardnumber.isEmpty || brand.isEmpty || expirymonth.isEmpty  || expiryyear.isEmpty  || cvv.isEmpty ) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Please fill all required fields.")),
                            );
                            return;
                          }

                          final saved = await insertCard(cardname, cardholder, cardnumber, brand, expirymonth, expiryyear, cvv);

                          if (context.mounted) {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(saved ?  "Card saved successfully!" : "Failed to save card. Try again.")),
                            );
                            cardControllerF.fetchCards();
                            cardNameController.clear();
                            cardholderController.clear();
                            cardNumberController.clear();
                            brandController.clear();
                            expiryMonthController.clear();
                            expiryYearController.clear();
                            cvvController.clear();
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
