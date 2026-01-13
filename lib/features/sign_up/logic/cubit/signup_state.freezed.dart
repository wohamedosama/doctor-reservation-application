// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SignupState<T> {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SignupState<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SignupState<$T>()';
  }
}

/// @nodoc
class $SignupStateCopyWith<T, $Res> {
  $SignupStateCopyWith(SignupState<T> _, $Res Function(SignupState<T>) __);
}

/// Adds pattern-matching-related methods to [SignupState].
extension SignupStatePatterns<T> on SignupState<T> {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignupInitial<T> value)? signupInitial,
    TResult Function(SignupLoading<T> value)? signupLoading,
    TResult Function(SignupSuccess<T> value)? signupSuccess,
    TResult Function(SignupFailure<T> value)? signupFailure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SignupInitial() when signupInitial != null:
        return signupInitial(_that);
      case SignupLoading() when signupLoading != null:
        return signupLoading(_that);
      case SignupSuccess() when signupSuccess != null:
        return signupSuccess(_that);
      case SignupFailure() when signupFailure != null:
        return signupFailure(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignupInitial<T> value) signupInitial,
    required TResult Function(SignupLoading<T> value) signupLoading,
    required TResult Function(SignupSuccess<T> value) signupSuccess,
    required TResult Function(SignupFailure<T> value) signupFailure,
  }) {
    final _that = this;
    switch (_that) {
      case _SignupInitial():
        return signupInitial(_that);
      case SignupLoading():
        return signupLoading(_that);
      case SignupSuccess():
        return signupSuccess(_that);
      case SignupFailure():
        return signupFailure(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignupInitial<T> value)? signupInitial,
    TResult? Function(SignupLoading<T> value)? signupLoading,
    TResult? Function(SignupSuccess<T> value)? signupSuccess,
    TResult? Function(SignupFailure<T> value)? signupFailure,
  }) {
    final _that = this;
    switch (_that) {
      case _SignupInitial() when signupInitial != null:
        return signupInitial(_that);
      case SignupLoading() when signupLoading != null:
        return signupLoading(_that);
      case SignupSuccess() when signupSuccess != null:
        return signupSuccess(_that);
      case SignupFailure() when signupFailure != null:
        return signupFailure(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? signupInitial,
    TResult Function()? signupLoading,
    TResult Function(T date)? signupSuccess,
    TResult Function(ApiErrorModel apiErrorModel)? signupFailure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SignupInitial() when signupInitial != null:
        return signupInitial();
      case SignupLoading() when signupLoading != null:
        return signupLoading();
      case SignupSuccess() when signupSuccess != null:
        return signupSuccess(_that.date);
      case SignupFailure() when signupFailure != null:
        return signupFailure(_that.apiErrorModel);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() signupInitial,
    required TResult Function() signupLoading,
    required TResult Function(T date) signupSuccess,
    required TResult Function(ApiErrorModel apiErrorModel) signupFailure,
  }) {
    final _that = this;
    switch (_that) {
      case _SignupInitial():
        return signupInitial();
      case SignupLoading():
        return signupLoading();
      case SignupSuccess():
        return signupSuccess(_that.date);
      case SignupFailure():
        return signupFailure(_that.apiErrorModel);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? signupInitial,
    TResult? Function()? signupLoading,
    TResult? Function(T date)? signupSuccess,
    TResult? Function(ApiErrorModel apiErrorModel)? signupFailure,
  }) {
    final _that = this;
    switch (_that) {
      case _SignupInitial() when signupInitial != null:
        return signupInitial();
      case SignupLoading() when signupLoading != null:
        return signupLoading();
      case SignupSuccess() when signupSuccess != null:
        return signupSuccess(_that.date);
      case SignupFailure() when signupFailure != null:
        return signupFailure(_that.apiErrorModel);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SignupInitial<T> implements SignupState<T> {
  const _SignupInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _SignupInitial<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SignupState<$T>.signupInitial()';
  }
}

/// @nodoc

class SignupLoading<T> implements SignupState<T> {
  const SignupLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SignupLoading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SignupState<$T>.signupLoading()';
  }
}

/// @nodoc

class SignupSuccess<T> implements SignupState<T> {
  const SignupSuccess(this.date);

  final T date;

  /// Create a copy of SignupState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SignupSuccessCopyWith<T, SignupSuccess<T>> get copyWith =>
      _$SignupSuccessCopyWithImpl<T, SignupSuccess<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SignupSuccess<T> &&
            const DeepCollectionEquality().equals(other.date, date));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(date));

  @override
  String toString() {
    return 'SignupState<$T>.signupSuccess(date: $date)';
  }
}

/// @nodoc
abstract mixin class $SignupSuccessCopyWith<T, $Res>
    implements $SignupStateCopyWith<T, $Res> {
  factory $SignupSuccessCopyWith(
          SignupSuccess<T> value, $Res Function(SignupSuccess<T>) _then) =
      _$SignupSuccessCopyWithImpl;
  @useResult
  $Res call({T date});
}

/// @nodoc
class _$SignupSuccessCopyWithImpl<T, $Res>
    implements $SignupSuccessCopyWith<T, $Res> {
  _$SignupSuccessCopyWithImpl(this._self, this._then);

  final SignupSuccess<T> _self;
  final $Res Function(SignupSuccess<T>) _then;

  /// Create a copy of SignupState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? date = freezed,
  }) {
    return _then(SignupSuccess<T>(
      freezed == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class SignupFailure<T> implements SignupState<T> {
  const SignupFailure(this.apiErrorModel);

  final ApiErrorModel apiErrorModel;

  /// Create a copy of SignupState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SignupFailureCopyWith<T, SignupFailure<T>> get copyWith =>
      _$SignupFailureCopyWithImpl<T, SignupFailure<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SignupFailure<T> &&
            (identical(other.apiErrorModel, apiErrorModel) ||
                other.apiErrorModel == apiErrorModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, apiErrorModel);

  @override
  String toString() {
    return 'SignupState<$T>.signupFailure(apiErrorModel: $apiErrorModel)';
  }
}

/// @nodoc
abstract mixin class $SignupFailureCopyWith<T, $Res>
    implements $SignupStateCopyWith<T, $Res> {
  factory $SignupFailureCopyWith(
          SignupFailure<T> value, $Res Function(SignupFailure<T>) _then) =
      _$SignupFailureCopyWithImpl;
  @useResult
  $Res call({ApiErrorModel apiErrorModel});
}

/// @nodoc
class _$SignupFailureCopyWithImpl<T, $Res>
    implements $SignupFailureCopyWith<T, $Res> {
  _$SignupFailureCopyWithImpl(this._self, this._then);

  final SignupFailure<T> _self;
  final $Res Function(SignupFailure<T>) _then;

  /// Create a copy of SignupState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? apiErrorModel = null,
  }) {
    return _then(SignupFailure<T>(
      null == apiErrorModel
          ? _self.apiErrorModel
          : apiErrorModel // ignore: cast_nullable_to_non_nullable
              as ApiErrorModel,
    ));
  }
}

// dart format on
