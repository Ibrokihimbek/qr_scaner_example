import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'scaner_event.dart';
part 'scaner_state.dart';

class ScanerBloc extends Bloc<ScanerEvent, ScanerState> {
  ScanerBloc() : super(ScanerState()) {
    on<ScanerCheckEvent>(_scanerCheck);
  }

  void _scanerCheck(ScanerCheckEvent event, Emitter<ScanerState> emit) {
    if (event.barCode.contains('BBTH242210')) {
      emit(
        state.copyWith(
          status: ScanerCheckStatus.suitable,
          barCode: event.barCode.substring(39, 45),
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: ScanerCheckStatus.unSuitable,
        ),
      );
    }
  }
}
