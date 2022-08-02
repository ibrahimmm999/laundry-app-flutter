import 'package:bloc/bloc.dart';

class ReceiptCubit extends Cubit<bool> {
  ReceiptCubit() : super((false));

  void setPage(bool newCondition) {
    emit(newCondition);
  }
}
