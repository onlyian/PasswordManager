import 'dart:convert';

class PasswordModel {
  final String website;
  final String username;
  final String email;
  final String password;

  PasswordModel(this.website, this.username, this.email, this.password);

  factory PasswordModel.fromMap(Map<String, dynamic> map) {
    return PasswordModel(
      map['website'],
      map['username'],
      map['email'],
      map['password'],
    );
  }

  static List<PasswordModel> fromJsonList(String source) {
    final List<dynamic> decoded = json.decode(source);
    return decoded.map((item) => PasswordModel.fromMap(item)).toList();
  }
}
