
import '../models/password_model.dart';

class Constants {

  static List<passwords> passwordData = [
    passwords("Netflix ", "kipruto@gmail.com",
        "https://pngimg.com/uploads/netflix/netflix_PNG15.png"),
    passwords("Twitter", "kipruto@gmail.com",
        "https://img.freepik.com/free-icon/twitter_318-674515.jpg"),
    passwords("Google ", "kipruto@gmail.com",
        "https://cdn-icons-png.flaticon.com/128/2702/2702602.png"),
    passwords("Dribbble Pro", "kipruto@gmail.com",
        "https://cdn.freebiesupply.com/logos/large/2x/dribbble-icon-1-logo-png-transparent.png"),
    passwords("Instagram ", "kipruto@gmail.com",
        "https://cdn-icons-png.freepik.com/256/1409/1409946.png?ga=GA1.1.308614930.1741333099&semt=ais_hybrid"),
  ];

  static List<String> addressData = ["twitter", "facebook", "Instagram",];

  static List<String> cardData = ["KCB","6234-8700-2666-3733","Kipruto Ian", "4/30", "Visa","345"];

  static List<String> websiteList = ["twitter", "facebook", "Instagram"];


  // static List<> _loginItems = [
  //   LoginItem(
  //     id: '1',
  //     websiteName: 'Google',
  //     websiteUrl: 'https://google.com',
  //     username: 'user@gmail.com',
  //     password: 'encrypted_password_here',
  //     createdAt: DateTime.now().subtract(const Duration(days: 30)),
  //     lastUsed: DateTime.now().subtract(const Duration(days: 2)),
  //   ),
  //   LoginItem(
  //     id: '2',
  //     websiteName: 'GitHub',
  //     websiteUrl: 'https://github.com',
  //     username: 'devuser',
  //     password: 'encrypted_password_here',
  //     createdAt: DateTime.now().subtract(const Duration(days: 60)),
  //     lastUsed: DateTime.now().subtract(const Duration(days: 5)),
  //   ),
  //   LoginItem(
  //     id: '3',
  //     websiteName: 'Twitter',
  //     websiteUrl: 'https://twitter.com',
  //     username: 'twitterhandle',
  //     password: 'encrypted_password_here',
  //     createdAt: DateTime.now().subtract(const Duration(days: 45)),
  //     lastUsed: DateTime.now().subtract(const Duration(days: 1)),
  //   ),
  //   LoginItem(
  //     id: '4',
  //     websiteName: 'Facebook',
  //     websiteUrl: 'https://facebook.com',
  //     username: 'fbuser',
  //     password: 'encrypted_password_here',
  //     createdAt: DateTime.now().subtract(const Duration(days: 90)),
  //     lastUsed: DateTime.now().subtract(const Duration(days: 10)),
  //   ),
  //   LoginItem(
  //     id: '5',
  //     websiteName: 'LinkedIn',
  //     websiteUrl: 'https://linkedin.com',
  //     username: 'professional_user',
  //     password: 'encrypted_password_here',
  //     createdAt: DateTime.now().subtract(const Duration(days: 20)),
  //     lastUsed: DateTime.now().subtract(const Duration(hours: 12)),
  //   ),
  // ];
}
class CardModel {
  final int? id;
  final String cardHolder;
  final String cardNumber;
  final String provider;
  final String cvv;
  final String expiryDate;

  CardModel({
    this.id,
    required this.cardHolder,
    required this.cardNumber,
    required this.provider,
    required this.cvv,
    required this.expiryDate,
  });

  factory CardModel.fromMap(Map<String, dynamic> map) => CardModel(
    id: map['id'],
    cardHolder: map['cardHolder'],
    cardNumber: map['cardNumber'],
    provider: map['provider'],
    cvv: map['cvv'],
    expiryDate: map['expiryDate'],
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'cardHolder': cardHolder,
    'cardNumber': cardNumber,
    'provider': provider,
    'cvv': cvv,
    'expiryDate': expiryDate,
  };
}
