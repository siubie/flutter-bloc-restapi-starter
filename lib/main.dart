import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mystarter/authentication/resources/authentication_repository.dart';
import 'package:mystarter/bloc_observer.dart';
import 'package:mystarter/boredactivity/resource/bored_service.dart';
import 'package:mystarter/routes/index.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    blocObserver: SimpleBlocObserver(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AuthenticationService authenticationService = AuthenticationService();
  BoredService boredService = BoredService();

  late AppRouter _appRouter;

  @override
  void initState() {
    super.initState();
    _appRouter = AppRouter(authenticationService, boredService);
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: authenticationService),
        RepositoryProvider.value(value: boredService),
      ],
      child: MaterialApp(
        title: "Trial OnGenerate Route",
        onGenerateRoute: _appRouter.onGenerateRoute,
      ),
    );
  }

  @override
  void dispose() {
    _appRouter.dispose();
    super.dispose();
  }
}
