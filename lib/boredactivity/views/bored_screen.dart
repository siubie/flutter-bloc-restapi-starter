import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mystarter/boredactivity/bloc/bored_bloc.dart';

class BoredActivityScreen extends StatelessWidget {
  static const String Route = '/bored';
  const BoredActivityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bored Screen"),
      ),
      body: BlocBuilder<BoredBloc, BoredState>(
        builder: (context, state) {
          if (state is BoredInitial) {
            return Text("Initial Text");
          }
          if (state is BoredLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is BoredLoaded) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    state.activityModel.activity,
                  ),
                  Text(
                    state.activityModel.type,
                  ),
                  Text(
                    state.activityModel.participants.toString(),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<BoredBloc>().add(LoadApiEvent());
                    },
                    child: Text("Load New Activity"),
                  ),
                ],
              ),
            );
          }
          return Text("Failed");
        },
      ),
    );
  }
}
