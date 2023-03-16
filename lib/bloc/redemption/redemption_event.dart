part of 'redemption_bloc.dart';

@immutable
abstract class RedemptionEvent {}

class SortDataEvent extends RedemptionEvent {
  final Sort? sortMode;

  SortDataEvent({this.sortMode});
}

class RedemptionPointEvent extends RedemptionEvent {
  final num pointUsed;

  RedemptionPointEvent({required this.pointUsed});
}
