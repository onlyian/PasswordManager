import 'dart:convert';

class AddressModel {
  final int id;
  final dynamic name;
  final dynamic organization;
  final dynamic phone;
  final String region;
  final String street;
  final String city;
  final String postalCode;

  AddressModel({
    required this.id,
    required this.name,
    required this.organization,
    required this.phone,
    required this.region,
    required this.street,
    required this.city,
    required this.postalCode,
  });

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      id: int.parse(map['id'].toString()),
      name: map['name'],
      organization: map['organization'],
      phone: map['phone'],
      region: map['region'],
      street: map['street'],
      city: map['city'],
      postalCode: map['postal_code'],
    );
  }

  static List<AddressModel> fromJsonList(List<dynamic> source) {
    return source.map((item) => AddressModel.fromMap(item)).toList();
  }
}
