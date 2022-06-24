import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mystarter/boredactivity/models/bored_activity_model.dart';
import 'package:mystarter/boredactivity/resource/bored_service.dart';

part 'bored_event.dart';
part 'bored_state.dart';

class BoredBloc extends Bloc<BoredEvent, BoredState> {
  final BoredService _boredService;
  BoredBloc(this._boredService) : super(BoredInitial()) {
    on<LoadApiEvent>((event, emit) async {
      emit(BoredLoading());
      try {
        final activity = await _boredService.getActivity();
        emit(
          BoredLoaded(
            activityModelFromJson(activity),
          ),
        );
      } catch (e) {
        emit(
          BoredLoadingFailed(e.toString()),
        );
      }
    });
  }
}
