import 'package:passwords_keeper/core/error/exception.dart';
import 'package:passwords_keeper/core/error/failure.dart';
import 'package:passwords_keeper/features/passwords_keeper/data/datasources/password_local_data_source.dart';
import 'package:passwords_keeper/features/passwords_keeper/data/models/password_list_item_model.dart';
import 'package:passwords_keeper/features/passwords_keeper/domain/entities/password_list_item_entity.dart';
import 'package:passwords_keeper/features/passwords_keeper/domain/repositories/person_repositories.dart';

class PasswordRepositoryImpl implements PasswordRepository {
  final PasswordLocalDataSource localDataSource;

  PasswordRepositoryImpl({required this.localDataSource});

  @override
  Future<List<PasswordListItemEntity>> getAllPassword() async {
    try {
      final passwords = await localDataSource.getPasswordsFromCache();
      return passwords as List<PasswordListItemEntity>;
    } on CacheException {
      throw CacheFailure();
    }
  }

  @override
  Future<void> savePassword(PasswordListItemEntity password) async {
    try {
      await localDataSource.passwordToCache(password as PasswordListItemModel);
    } on CacheException {
      throw CacheFailure();
    }
  }

  @override
  Future<List<PasswordListItemEntity>> searchPassword(String query) async {
    try {
      List<PasswordListItemEntity> searchResult = [];
      final password = await localDataSource.getPasswordsFromCache();
      password.map((password) {
        if (password.serviceName.contains(query)) {
          searchResult.add(password as PasswordListItemEntity);
        }
      });
      return searchResult;
    } on CacheException {
      throw CacheFailure();
    }
  }
}
