part of 'scaner_bloc.dart';

abstract class ScanerEvent extends Equatable {
  const ScanerEvent();
}

class ScanerCheckEvent extends ScanerEvent {
  final String barCode;
  const ScanerCheckEvent({required this.barCode});

  @override
  List<Object?> get props => [barCode];
}
