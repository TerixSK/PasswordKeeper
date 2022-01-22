abstract class PasswordSearchEvent {}

class SearchPasswordsEvent extends PasswordSearchEvent {
  final String passwordQuery;

  SearchPasswordsEvent({required this.passwordQuery});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SearchPasswordsEvent &&
        other.passwordQuery == passwordQuery;
  }

  @override
  int get hashCode => passwordQuery.hashCode;
}
