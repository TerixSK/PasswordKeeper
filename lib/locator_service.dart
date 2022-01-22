import 'package:get_it/get_it.dart';
import 'package:passwords_keeper/features/passwords_keeper/data/datasources/password_local_data_source.dart';
import 'package:passwords_keeper/features/passwords_keeper/data/repositories/person_repository_impl.dart';
import 'package:passwords_keeper/features/passwords_keeper/domain/repositories/person_repositories.dart';
import 'package:passwords_keeper/features/passwords_keeper/presentation/bloc/password_list_bloc/password_list_block.dart';
import 'package:passwords_keeper/features/passwords_keeper/presentation/bloc/search_bloc/search_block.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => PasswordListBloc(passwordRepository: sl()));
  sl.registerFactory(() => PasswordSearchBloc(passwordRepository: sl()));

  sl.registerLazySingleton<PasswordRepository>(
      () => PasswordRepositoryImpl(localDataSource: sl()));
  sl.registerLazySingleton<PasswordLocalDataSource>(
      () => PasswordLocalDataSourceImpl(sharedPreferences: sl()));

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
