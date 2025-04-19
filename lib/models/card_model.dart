import 'dart:convert';

class CardModel {
  final String name;
  final String cardholderName;
  final String cardNumber;
  final String brand;
  final int expiryMonth;
  final int expiryYear;
  final String cvv;

  CardModel({
    required this.name,
    required this.cardholderName,
    required this.cardNumber,
    required this.brand,
    required this.expiryMonth,
    required this.expiryYear,
    required this.cvv,
  });

  factory CardModel.fromMap(Map<String, dynamic> map) {
    return CardModel(
      name: map['name'],
      cardholderName: map['cardholder_name'],
      cardNumber: map['card_number'],
      brand: map['brand'],
      expiryMonth: int.parse(map['expiry_month']),
      expiryYear: int.parse(map['expiry_year']),
      cvv: map['cvv'],
    );
  }

  static List<CardModel> fromJsonList(String source) {
    final List<dynamic> decoded = json.decode(source);
    return decoded.map((item) => CardModel.fromMap(item)).toList();
  }
}
