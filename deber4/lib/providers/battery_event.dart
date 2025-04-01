part of 'battery_bloc.dart';

@immutable
abstract class BatteryEvent {}

class BatteryLevelUpdated extends BatteryEvent {
  final int level;
  BatteryLevelUpdated(this.level);
}