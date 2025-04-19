import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_screen/views/screens/Settings.dart';
import '../../../models/card_model.dart';


class CardInfoScreen extends StatefulWidget {
  final CardModel card;

  const CardInfoScreen({Key? key, required this.card}) : super(key: key);

  @override
  State<CardInfoScreen> createState() => _CardInfoScreenState();
}

class _CardInfoScreenState extends State<CardInfoScreen> {
  bool showCardNumber = false;
  bool showCVV = false;

  void copyToClipboard(String label, String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$label copied')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final card = widget.card;
    return Scaffold(
      appBar: AppBar(
        title: Text("Card Details"),
        backgroundColor: Colors.cyan,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Card visual
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.sim_card, color: Colors.amber),
                      SizedBox(width: 5,),
                      Text(
                        card.name,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    showCardNumber ? card.cardNumber : "•••• •••• •••• ${card.cardNumber.substring(card.cardNumber.length - 4)}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Expiry: ${card.expiryMonth}/${card.expiryYear}",
                          style: TextStyle(color: Colors.black54)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: Icon(showCardNumber ? Icons.visibility_off : Icons.visibility,
                                color: Colors.white),
                            onPressed: () async {
                              if(!showCardNumber){
                                if (await BiometricPassed()) {
                                  setState(() {
                                    showCardNumber = !showCardNumber;
                                  });
                                }
                              }else{
                                setState(() {
                                  showCardNumber = !showCardNumber;
                                });
                              }
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.copy, color: Colors.white),
                            onPressed: () async {
                              if (await BiometricPassed()){
                                copyToClipboard("Card Number", card.cardNumber);
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // CVV Row
            ListTile(
              title: Text("Cardholder"),
              subtitle: Text(card.cardholderName),
              leading: Icon(Icons.person),
            ),
            ListTile(
              title: Text("Card Brand"),
              subtitle: Text(card.brand),
              leading: Icon(Icons.credit_card),
            ),
            ListTile(
              title: Text("CVV"),
              subtitle: Text(showCVV ? card.cvv : "•••"),
              leading: Icon(Icons.lock),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(showCVV ? Icons.visibility_off : Icons.visibility),
                    onPressed: ()async {
                     if(!showCVV) {
                        if (await BiometricPassed()) {
                          setState(() {
                            showCVV = !showCVV;
                          });
                        }
                      }else{
                       setState(() {
                         showCVV = !showCVV;
                       });
                     }
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.copy),
                    onPressed: () async {
                      if (await BiometricPassed()){
                        copyToClipboard("CVV", card.cvv);
                      }
                    },
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



