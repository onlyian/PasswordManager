import 'dart:convert';

class CardModel {
  final int id;
  final String name;
  final String cardholderName;
  final String cardNumber;
  final String brand;
  final dynamic expiryMonth;
  final dynamic expiryYear;
  final dynamic cvv;

  CardModel({
    required this.id,
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
      id: int.parse(map['id'].toString()),
      name: map['name'],
      cardholderName: map['cardholder_name'],
      cardNumber: map['card_number'],
      brand: map['brand'],
      expiryMonth: map['expiry_month'],
      expiryYear: map['expiry_year'],
      cvv: map['cvv'],
    );
  }

  static List<CardModel> fromJsonList(String source) {
    final List<dynamic> decoded = json.decode(source);
    return decoded.map((item) => CardModel.fromMap(item)).toList();
  }
}
