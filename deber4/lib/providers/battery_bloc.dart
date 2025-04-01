import 'dart:async';
import 'package:battery_plus/battery_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'battery_event.dart';
part 'battery_state.dart';

class BatteryBloc extends Bloc<BatteryEvent, BatteryState> {
  final Battery _battery = Battery();
  StreamSubscription? _subscription;

  BatteryBloc() : super(BatteryLevelState(0)) {
    on<BatteryLevelUpdated>((event, emit) {
      emit(BatteryLevelState(event.level));
    });

    _startMonitoring();
  }

  void _startMonitoring() async {
    final initialLevel = await _battery.batteryLevel;
    add(BatteryLevelUpdated(initialLevel));

    _subscription = _battery.onBatteryStateChanged.listen((state) async {
      final currentLevel = await _battery.batteryLevel;
      add(BatteryLevelUpdated(currentLevel));
    });
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}