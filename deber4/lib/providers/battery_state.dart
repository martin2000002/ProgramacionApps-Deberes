part of 'battery_bloc.dart';

@immutable
abstract class BatteryState {}

class BatteryLevelState extends BatteryState {
  final int level;
  BatteryLevelState(this.level);
}