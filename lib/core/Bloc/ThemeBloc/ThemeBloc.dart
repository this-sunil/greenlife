import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenlife/core/service/StorageService.dart';

import '../../theme/AppTheme.dart';

part 'ThemeEvent.dart';
part 'ThemeState.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState.initial()) {
    on<LoadThemeEvent>(_loadTheme);
    on<SetThemeEvent>(_setTheme);
  }

  StorageService service = StorageService();

  Future<void> _setTheme(SetThemeEvent event, Emitter<ThemeState> emit) async {
    switch (event.isDark) {
      case true:
        await service.setTheme('light');
        return emit(state.copyWith(status: .completed, theme: AppTheme.light));
      default:
        await service.setTheme('dark');
        return emit(state.copyWith(status: .completed, theme: AppTheme.dark));
    }
  }

  Future<void> _loadTheme(
    LoadThemeEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final String? isDark = await service.getTheme();
    switch (isDark) {
      case 'dark':
        return emit(state.copyWith(status: .completed, theme: AppTheme.dark));
      default:
        return emit(state.copyWith(status: .completed, theme: AppTheme.light));
    }
  }
}
