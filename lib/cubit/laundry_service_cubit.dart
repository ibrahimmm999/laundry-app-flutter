import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/models/laundry_service_model.dart';
import 'package:flutter_application_1/services/laundry_service.dart';

part 'laundry_service_state.dart';

class LaundryServiceCubit extends Cubit<LaundryServiceState> {
  LaundryServiceCubit() : super(LaundryServiceInitial());

  void fetchLaundryService() async {
    try {
      emit(LaundryServiceLoading());
      List<ServiceModel> destinations =
          await LaundryService().fetchLaundryService();
      emit(LaundryServiceSuccess(destinations));
    } catch (e) {
      emit(LaundryServiceFailed(e.toString()));
    }
  }
}
