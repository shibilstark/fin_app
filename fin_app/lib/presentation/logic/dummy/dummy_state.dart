part of 'dummy_cubit.dart';

abstract class DummyState extends Equatable {
  const DummyState();

  @override
  List<Object> get props => [];
}

class DummyInitial extends DummyState {}

class DummyLoading extends DummyState {}

class DummyError extends DummyState {
  final AppFailure failure;
  const DummyError(this.failure);
  @override
  List<Object> get props => [failure];
}

class DummySuccess extends DummyState {
  final List<DummyModel> dummyDatas;
  final SortTypes sortType;

  const DummySuccess(this.dummyDatas, this.sortType);
  @override
  List<Object> get props => [dummyDatas, sortType];
}
