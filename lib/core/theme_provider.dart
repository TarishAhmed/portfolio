import 'dart:ui';

import 'package:flutter/scheduler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

@riverpod
class ThemeState extends _$ThemeState {
  @override
  bool build() =>
      SchedulerBinding.instance.platformDispatcher.platformBrightness ==
      Brightness.dark;

  toggleDarkMode() => state = !state;
}
