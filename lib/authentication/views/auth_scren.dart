import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mystarter/authentication/bloc/authentication_bloc.dart';

class AuthScreen extends StatelessWidget {
  static const String Route = '/';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Auth Screen"),
      ),
      body: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationInitial) {
            return Center(
              child: Text("Auth Initial"),
            );
          }
          if (state is AuthenticationInProgress) {
            return Center(
              child: Text("Auth In Progres"),
            );
          }
          if (state is AuthenticationFailed) {
            return Center(
              child: Text("Auth Failed"),
            );
          }
          if (state is AuthenticationSuccess) {
            return Center(
              child: Text("Authentication Success"),
            );
          }
          return Center(
            child: Text("Auth Screen"),
          );
        },
      ),
    );
  }
}
