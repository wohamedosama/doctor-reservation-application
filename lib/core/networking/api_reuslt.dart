import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_reuslt.freezed.dart';

@Freezed()
abstract class ApiReuslt<T> with _$ApiReuslt<T> {
  const factory ApiReuslt.success(T data) = Success<T>;
  const factory ApiReuslt.failure(String message) = Failure<T>;
}
