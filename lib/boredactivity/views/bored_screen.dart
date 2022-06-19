import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mystarter/boredactivity/bloc/bored_bloc.dart';
import 'package:mystarter/boredactivity/resource/bored_service.dart';

class BoredActivityScreen extends StatelessWidget {
  const BoredActivityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BoredBloc(
        RepositoryProvider.of<BoredService>(context),
      )..add(LoadApiEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Bored Activity"),
        ),
        body: BlocBuilder<BoredBloc, BoredState>(
          builder: (context, state) {
            if (state is BoredLoading) {
              return _loadingScreen();
            }
            if (state is BoredLoaded) {
              return _activityScreen(state, context);
            }
            if (state is BoredLoadingFailed) {
              return _errorScreen();
            }
            return _errorScreen();
          },
        ),
      ),
    );
  }

  Center _errorScreen() {
    return const Center(
      child: Text("Ngawur"),
    );
  }

  Center _activityScreen(BoredLoaded state, BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(state.activityModel.activity),
          Text(state.activityModel.type),
          ElevatedButton(
            onPressed: () =>
                BlocProvider.of<BoredBloc>(context).add(LoadApiEvent()),
            child: Text("Load Next Activity"),
          )
        ],
      ),
    );
  }

  Center _loadingScreen() {
    return const Center(
      child: Text("Lagi Loading"),
    );
  }
}
