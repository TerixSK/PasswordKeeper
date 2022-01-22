import 'package:flutter/foundation.dart';

import 'package:passwords_keeper/features/passwords_keeper/domain/entities/password_list_item_entity.dart';

abstract class PasswordSearchState {}

class PasswordSearchEmptyState extends PasswordSearchState {}

class PasswordSearchLoadingState extends PasswordSearchState {}

class PasswordSearchLoadedState extends PasswordSearchState {
  final List<PasswordListItemEntity> passwords;

  PasswordSearchLoadedState(this.passwords);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PasswordSearchLoadedState &&
        listEquals(other.passwords, passwords);
  }

  @override
  int get hashCode => passwords.hashCode;
}

class PasswordSearchErrorState extends PasswordSearchState {
  final String message;

  PasswordSearchErrorState(this.message);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PasswordSearchErrorState && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
