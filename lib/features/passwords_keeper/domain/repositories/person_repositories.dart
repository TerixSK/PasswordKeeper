import 'package:passwords_keeper/features/passwords_keeper/domain/entities/password_list_item_entity.dart';

abstract class PasswordRepository {
  Future<List<PasswordListItemEntity>> getAllPassword();
  Future<void> savePasswords(List<PasswordListItemEntity> passwords);
  Future<List<PasswordListItemEntity>> searchPassword(String query);
}
