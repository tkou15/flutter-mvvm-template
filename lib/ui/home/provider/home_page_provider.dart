import 'package:flapp/controller/counter_controller.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'home_page_provider.freezed.dart';

final homePageProvider =
    StateNotifierProvider.autoDispose<HomePageProvider, HomePageState>(
  (ref) => HomePageProvider(ref.watch(counterController.notifier)),
);

@freezed
class HomePageState with _$HomePageState {
  const factory HomePageState({
    @Default(false) bool isUpdating,
  }) = _HomePageState;
}

/// HomePageのUI用の状態管理やタップ時のロジックコードなどを担うクラス
class HomePageProvider extends StateNotifier<HomePageState> {
  HomePageProvider(this._counterController) : super(const HomePageState());

  final CounterController _counterController;

  Future<void> onPressedIncrementButton() async {
    final count = _counterController.state.value?.count;
    if (state.isUpdating || count == null) {
      return;
    }
    state = state.copyWith(isUpdating: true);

    try {
      await _counterController.registerCount(count: count + 1);
    } on Exception catch (e) {
      //
    }

    state = state.copyWith(isUpdating: false);
  }
}
