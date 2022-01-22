import 'dart:convert';

class PasswordListItemModel {
  final String serviceName;
  final String login;
  final String password;
  final String url;
  final String description;

  PasswordListItemModel({
    required this.serviceName,
    required this.login,
    required this.password,
    required this.url,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'serviceName': serviceName,
      'login': login,
      'password': password,
      'url': url,
      'description': description,
    };
  }

  factory PasswordListItemModel.fromMap(Map<String, dynamic> map) {
    return PasswordListItemModel(
      serviceName: map['serviceName'] ?? '',
      login: map['login'] ?? '',
      password: map['password'] ?? '',
      url: map['url'] ?? '',
      description: map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PasswordListItemModel.fromJson(String source) =>
      PasswordListItemModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PasswordListItem(serviceName: $serviceName, login: $login, password: $password, url: $url, description: $description)';
  }
}
