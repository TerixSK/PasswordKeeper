import 'package:flutter/foundation.dart';

import 'package:passwords_keeper/features/passwords_keeper/domain/entities/password_list_item_entity.dart';

abstract class PasswordListEvent {}

class GetPasswordListEvent extends PasswordListEvent {}

class SavePasswordsEvent extends PasswordListEvent {
  List<PasswordListItemEntity> passwords;

  SavePasswordsEvent({required this.passwords});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SavePasswordsEvent &&
        listEquals(other.passwords, passwords);
  }

  @override
  int get hashCode => passwords.hashCode;
}
