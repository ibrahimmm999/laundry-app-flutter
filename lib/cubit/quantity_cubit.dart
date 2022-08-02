import 'package:bloc/bloc.dart';

class QuantityCubit extends Cubit<List<String>> {
  QuantityCubit() : super([]);

  void incrementQuantity(String id) {
    print('prev $state');
    state.add(id);
    print('new $state');
    emit(state);
  }

  void decrementQuantity() {
    print('prev $state');
    if (state.isNotEmpty) {
      state.removeLast();
    }
    print('new $state');
    emit(state);
  }
}
