import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mystarter/bloc_observer.dart';
import 'package:mystarter/boredactivity/bloc/bored_bloc.dart';
import 'package:mystarter/boredactivity/resource/bored_service.dart';
import 'package:mystarter/routes/index.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    blocObserver: SimpleBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => BoredService(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<BoredBloc>(
            create: (context) => BoredBloc(
              RepositoryProvider.of<BoredService>(context),
            )..add(
                LoadApiEvent(),
              ),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          onGenerateRoute: routes,
        ),
      ),
    );
  }
}
