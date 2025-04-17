import 'package:get/get.dart';

class VaultCard {
  final String title;
  final String number;
  final String provider;
  final String expiry;

  VaultCard({
    required this.title,
    required this.number,
    required this.provider,
    required this.expiry,
  });
}

class HomeScreenController extends GetxController {
  var selectedScreenIndex = 0.obs;
  RxString activeCategory = 'Vault'.obs;

 static var cards = <VaultCard>[
    VaultCard(
      title: "Visa Classic",
      number: "1234 5678 9012 3456",
      provider: "Equity Bank",
      expiry: "12/26",
    ),
    VaultCard(
      title: "MasterCard Gold",
      number: "9876 5432 1098 7654",
      provider: "KCB",
      expiry: "11/25",
    ),
    VaultCard(
      title: "American Express",
      number: "1111 2222 3333 4444",
      provider: "ABSA",
      expiry: "01/27",
    ),
  ].obs;

  void updateSelectedIndex(int index) {
    selectedScreenIndex.value = index;
    activeCategory.value = index == 0 ? 'Vault' : 'Settings';
  }
}

class Address {
  final int? id;
  final String? name;
  final String? organization;
  final String? phone;
  final String region;
  final String street;
  final String city;
  final String postalCode;

  Address({
    this.id,
    this.name,
    this.organization,
    this.phone,
    required this.region,
    required this.street,
    required this.city,
    required this.postalCode,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['id'],
      name: json['name'],
      organization: json['organization'],
      phone: json['phone'],
      region: json['region'],
      street: json['street'],
      city: json['city'],
      postalCode: json['postal_code'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'organization': organization,
      'phone': phone,
      'region': region,
      'street': street,
      'city': city,
      'postal_code': postalCode,
    };
  }
}

