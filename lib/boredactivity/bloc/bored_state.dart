part of 'bored_bloc.dart';

abstract class BoredState extends Equatable {
  const BoredState();

  @override
  List<Object> get props => [];
}

class BoredInitial extends BoredState {}

class BoredLoading extends BoredState {}

class BoredLoadingFailed extends BoredState {
  final String message;

  const BoredLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}

class BoredLoaded extends BoredState {
  final ActivityModel activityModel;

  const BoredLoaded(this.activityModel);

  @override
  List<Object> get props => [activityModel];
}
