import 'package:passwords_keeper/core/error/exception.dart';
import 'package:passwords_keeper/features/passwords_keeper/data/models/password_list_item_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PasswordLocalDataSource {
  Future<List<PasswordListItemModel>> getPasswordsFromCache();
  Future<List<String>> passwordToCache(List<PasswordListItemModel> passwords);
}

const String cashcedPasswordListKey = 'CASHED_PASSWORD_LIST_KEY';

class PasswordLocalDataSourceImpl implements PasswordLocalDataSource {
  final SharedPreferences sharedPreferences;

  PasswordLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<PasswordListItemModel>> getPasswordsFromCache() {
    final jsonPasswordList =
        sharedPreferences.get(cashcedPasswordListKey) as List;
    if (jsonPasswordList.isNotEmpty) {
      return Future.value(jsonPasswordList
          .map((password) => PasswordListItemModel.fromJson(password))
          .toList());
    } else {
      throw CacheException();
    }
  }

  @override
  Future<List<String>> passwordToCache(List<PasswordListItemModel> passwords) {
    final List<String> jsonPasswordList =
        passwords.map((password) => password.toJson()).toList();

    sharedPreferences.setStringList(cashcedPasswordListKey, jsonPasswordList);
    return Future.value(jsonPasswordList);
  }
}
