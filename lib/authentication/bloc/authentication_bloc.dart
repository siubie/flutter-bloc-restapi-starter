import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mystarter/authentication/resources/authentication_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationService _authenticationService;
  AuthenticationBloc(this._authenticationService)
      : super(AuthenticationInitial()) {
    on<LoginButtonPressed>((event, emit) async {
      emit(AuthenticationInProgress());
      try {
        final authResponse = await _authenticationService
            .loginWithEmailAndPassword("superadmin@gmail.com", "password");
        emit(AuthenticationSuccess());
      } catch (e) {
        emit(AuthenticationFailed());
      }
    });
  }
}
