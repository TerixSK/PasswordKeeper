import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passwords_keeper/core/error/failure.dart';
import 'package:passwords_keeper/features/passwords_keeper/domain/repositories/person_repositories.dart';
import 'package:passwords_keeper/features/passwords_keeper/presentation/bloc/search_bloc/search_event.dart';
import 'package:passwords_keeper/features/passwords_keeper/presentation/bloc/search_bloc/search_state.dart';

const String cacheFailureMesssage = 'Cache Failure';

class PasswordSearchBloc
    extends Bloc<PasswordSearchEvent, PasswordSearchState> {
  final PasswordRepository passwordRepository;

  PasswordSearchBloc({required this.passwordRepository})
      : super(PasswordSearchEmptyState());

  Stream<PasswordSearchState> mapEventToState(
      PasswordSearchEvent event) async* {
    if (event is SearchPasswordsEvent) {
      yield PasswordSearchLoadingState();
      try {
        final passwords =
            await passwordRepository.searchPassword(event.passwordQuery);
        yield PasswordSearchLoadedState(passwords);
      } on CacheFailure {
        yield PasswordSearchErrorState(cacheFailureMesssage);
      }
    }
  }
}
