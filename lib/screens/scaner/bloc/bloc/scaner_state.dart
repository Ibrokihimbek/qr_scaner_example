part of 'scaner_bloc.dart';

class ScanerState extends Equatable {
  final String barCode;
  final ScanerCheckStatus status;
  const ScanerState({
    this.barCode = '',
    this.status = ScanerCheckStatus.initial,
  });

  ScanerState copyWith({String? barCode, ScanerCheckStatus? status}) {
    return ScanerState(
      barCode: barCode ?? this.barCode,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [barCode, status];
}

enum ScanerCheckStatus { initial, suitable, unSuitable }

extension ScanerCheckStatusX on ScanerCheckStatus {
  bool get isInitial => this == ScanerCheckStatus.initial;

  bool get isSutiable => this == ScanerCheckStatus.suitable;

  bool get isUnSuitable => this == ScanerCheckStatus.unSuitable;
}
