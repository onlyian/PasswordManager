import 'dart:convert';

class PasswordModel {
  final int id;
  final String website;
  final String username;
  final String email;
  final String password;

  PasswordModel(this.id,this.website, this.username, this.email, this.password);

  factory PasswordModel.fromMap(Map<String, dynamic> map) {
    return PasswordModel(
      int.parse(map['id'].toString()),
      map['website'],
      map['username'],
      map['email'],
      map['password'],
    );
  }

  static List<PasswordModel> fromJsonList(List<dynamic> source) {
    return source.map((item) => PasswordModel.fromMap(item)).toList();
  }
}
