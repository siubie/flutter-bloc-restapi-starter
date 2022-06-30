import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mystarter/authentication/bloc/authentication_bloc.dart';
import 'package:mystarter/authentication/resources/authentication_repository.dart';
import 'package:mystarter/authentication/views/auth_scren.dart';
import 'package:mystarter/boredactivity/bloc/bored_bloc.dart';
import 'package:mystarter/boredactivity/resource/bored_service.dart';
import 'package:mystarter/boredactivity/views/bored_screen.dart';

class AppRouter {
  late AuthenticationBloc _authenticationBloc;
  late BoredBloc _boredBloc;

  AppRouter(
      AuthenticationService authenticationService, BoredService boredService) {
    _authenticationBloc = AuthenticationBloc(authenticationService);
    _boredBloc = BoredBloc(boredService);
  }
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AuthScreen.Route:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _authenticationBloc
              ..add(
                LoginButtonPressed(),
              ),
            child: const AuthScreen(),
          ),
        );

      case BoredActivityScreen.Route:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _boredBloc
              ..add(
                LoadApiEvent(),
              ),
            child: const BoredActivityScreen(),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _boredBloc,
            child: const BoredActivityScreen(),
          ),
        );
    }
  }

  void dispose() {
    _authenticationBloc.close();
  }
}
