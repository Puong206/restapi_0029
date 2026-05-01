import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restapi_0029/data/repositories/auth_repository.dart';
import 'package:restapi_0029/logic/bloc/auth/auth_event.dart';
import 'package:restapi_0029/logic/bloc/auth/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState>{
  final AuthRepository repository;

  AuthBloc({required this.repository}) : super(AuthInitial()) {
    on<AppStarted>((event, emit) async {
      final token = await repository.getToken();
      if (token != null) {
        emit(Authenticated(token));
      } else {
        emit(Unauthenticated());
      }
    });
  }
}