import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metaway_holdings/core/base_cubit/stateful_widget/state_layout.dart';
import 'package:metaway_holdings/core/network/exceptions/error_exception.dart';
import 'package:rxdart/rxdart.dart';
import 'package:dartx/dartx.dart';

part 'rx.dart';

abstract class BaseCubit<State> extends BlocBase<State> {
  BaseCubit(State initialState) : super(initialState);

  // State
  final BehaviorSubject<StateLayout> _state =
      BehaviorSubject<StateLayout>.seeded(StateLayout.showLoading);

  Stream<StateLayout> get stateStream => _state.stream;

  Sink<StateLayout> get stateSink => _state.sink;

  // Loading
  bool get isLoadingState => _state.value == StateLayout.showLoading;
  BehaviorSubject<bool> loadingSbj = BehaviorSubject<bool>.seeded(false);

  Stream<bool> get loadingStream => loadingSbj.stream;

  Sink<bool> get loadingSink => loadingSbj.sink;

  // Load more
  BehaviorSubject<bool> loadMoreSbj = BehaviorSubject<bool>.seeded(false);

  Stream<bool> get loadMoreStream => loadMoreSbj.stream;

  Sink<bool> get loadMoreSink => loadMoreSbj.sink;

  bool get isLoadMore => loadMoreSbj.value;

  // Error exception
  final BehaviorSubject<ErrorException> _error =
      BehaviorSubject<ErrorException>();

  Stream<ErrorException> get errorStream => _error.stream;

  Sink<ErrorException> get errorSink => _error.sink;

  List<StreamSubscription> subs = [];

  Future<void> onRefresh({dynamic args}) async {}

  void retry() {}

  @protected
  @mustCallSuper
  void init({dynamic args}) {}

  void showLoading() {
    _state.wellAdd(StateLayout.showLoading);
  }

  void showError() {
    _state.wellAdd(StateLayout.showError);
  }

  void showEmpty() {
    _state.wellAdd(StateLayout.showEmpty);
  }

  void showContent() {
    _state.wellAdd(StateLayout.showContent);
  }

  void setLoading(bool val) {
    loadingSbj.wellAdd(val);
  }

  void setLoadMore(bool val) {
    loadMoreSbj.wellAdd(val);
  }

  @override
  Future<void> close() {
    loadingSbj.close();
    loadMoreSbj.close();
    _error.close();
    _state.close();
    subs.dispose();
    return super.close();
  }
}
