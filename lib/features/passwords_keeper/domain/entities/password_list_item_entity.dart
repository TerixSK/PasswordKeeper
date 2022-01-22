class PasswordListItemEntity {
  final String serviceName;
  final String login;
  final String password;
  final String url;
  final String description;

  PasswordListItemEntity(
      {required this.serviceName,
      required this.login,
      required this.password,
      required this.url,
      required this.description});

  PasswordListItemEntity copyWith({
    String? serviceName,
    String? login,
    String? password,
    String? url,
    String? description,
  }) {
    return PasswordListItemEntity(
      serviceName: serviceName ?? this.serviceName,
      login: login ?? this.login,
      password: password ?? this.password,
      url: url ?? this.url,
      description: description ?? this.description,
    );
  }

  @override
  String toString() {
    return 'PasswordListItem(serviceName: $serviceName, login: $login, password: $password, url: $url, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PasswordListItemEntity &&
        other.serviceName == serviceName &&
        other.login == login &&
        other.password == password &&
        other.url == url &&
        other.description == description;
  }

  @override
  int get hashCode {
    return serviceName.hashCode ^
        login.hashCode ^
        password.hashCode ^
        url.hashCode ^
        description.hashCode;
  }
}
