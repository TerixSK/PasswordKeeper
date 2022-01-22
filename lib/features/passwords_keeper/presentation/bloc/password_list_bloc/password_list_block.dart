import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passwords_keeper/core/error/failure.dart';
import 'package:passwords_keeper/features/passwords_keeper/domain/repositories/person_repositories.dart';
import 'package:passwords_keeper/features/passwords_keeper/presentation/bloc/password_list_bloc/password_list_event.dart';
import 'package:passwords_keeper/features/passwords_keeper/presentation/bloc/password_list_bloc/password_list_state.dart';

const String cacheFailureMesssage = 'Cache Failure';

class PasswordListBloc extends Bloc<PasswordListEvent, PasswordListState> {
  final PasswordRepository passwordRepository;

  PasswordListBloc({required this.passwordRepository})
      : super(PasswordListEmptyState());

  Stream<PasswordListState> mapEventToState(PasswordListEvent event) async* {
    if (event is GetPasswordListEvent) {
      yield (PasswordListLoadingState());
      try {
        final passwords = await passwordRepository.getAllPassword();
        yield PasswordListLoadedState(passwords);
      } on CacheFailure {
        yield PasswordListErrorState(cacheFailureMesssage);
      }
    } else if (event is SavePasswordEvent) {
      try {
        await passwordRepository.savePassword(event.password);
      } on CacheFailure {
        yield PasswordListErrorState(cacheFailureMesssage);
      }
    }
  }
}
