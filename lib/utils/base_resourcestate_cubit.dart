import 'package:flutter_bloc/flutter_bloc.dart';

enum ResourceStatus { initial, loading, success, error }

class BaseResourceState<T> {
  const BaseResourceState._({
    required this.status,
    this.data,
    this.error,
  });

  const BaseResourceState.initial() : this._(status: ResourceStatus.initial);

  const BaseResourceState.loading() : this._(status: ResourceStatus.loading);

  const BaseResourceState.success(T data)
      : this._(status: ResourceStatus.success, data: data);

  const BaseResourceState.error(String message)
      : this._(status: ResourceStatus.error, error: message);

  final ResourceStatus status;
  final T? data;
  final String? error;

  R map<R>({
    required R Function(BaseResourceState<T>) initial,
    required R Function(BaseResourceState<T>) loading,
    required R Function(BaseResourceState<T>) success,
    required R Function(BaseResourceState<T>) error,
  }) {
    switch (status) {
      case ResourceStatus.initial:
        return initial(this);
      case ResourceStatus.loading:
        return loading(this);
      case ResourceStatus.success:
        return success(this);
      case ResourceStatus.error:
        return error(this);
    }
  }
}

abstract class BaseResourceCubit<T> extends Cubit<BaseResourceState<T>> {
  BaseResourceCubit() : super(const BaseResourceState.initial());

  Future<void> executeRequest(Future<T> Function() request) async {
    emit(const BaseResourceState.loading());
    try {
      final result = await request();
      emit(BaseResourceState.success(result));
    } catch (e) {
      emit(BaseResourceState.error(e.toString()));
    }
  }
}
