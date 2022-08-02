part of 'laundry_service_cubit.dart';

abstract class LaundryServiceState extends Equatable {
  const LaundryServiceState();

  @override
  List<Object> get props => [];
}

class LaundryServiceInitial extends LaundryServiceState {}

class LaundryServiceLoading extends LaundryServiceState {}

class LaundryServiceSuccess extends LaundryServiceState {
  final List<ServiceModel> destinations;

  LaundryServiceSuccess(this.destinations);
  @override
  // TODO: implement props
  List<Object> get props => [destinations];
}

class LaundryServiceFailed extends LaundryServiceState {
  final String error;
  LaundryServiceFailed(this.error);
  @override
  // TODO: implement props
  List<Object> get props => [error];
}
