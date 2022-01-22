import 'package:passwords_keeper/features/passwords_keeper/domain/entities/password_list_item_entity.dart';

abstract class PasswordListEvent {}

class GetPasswordListEvent extends PasswordListEvent {}

class SavePasswordEvent extends PasswordListEvent {
  PasswordListItemEntity password;

  SavePasswordEvent({required this.password});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SavePasswordEvent && other.password == password;
  }

  @override
  int get hashCode => password.hashCode;
}
