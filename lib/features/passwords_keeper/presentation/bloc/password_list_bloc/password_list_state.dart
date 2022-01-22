import 'package:flutter/foundation.dart';

import 'package:passwords_keeper/features/passwords_keeper/domain/entities/password_list_item_entity.dart';

abstract class PasswordListState {}

class PasswordListEmptyState extends PasswordListState {}

class PasswordListLoadingState extends PasswordListState {}

class PasswordListLoadedState extends PasswordListState {
  final List<PasswordListItemEntity> passwords;

  PasswordListLoadedState(this.passwords);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PasswordListLoadedState &&
        listEquals(other.passwords, passwords);
  }

  @override
  int get hashCode => passwords.hashCode;
}

class PasswordListErrorState extends PasswordListState {
  final String message;

  PasswordListErrorState(this.message);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PasswordListErrorState && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
