// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SignUpFormEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() signInWithEmail,
    required TResult Function(String email) emailOnChanged,
    required TResult Function(String password) passwordOnChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? signInWithEmail,
    TResult? Function(String email)? emailOnChanged,
    TResult? Function(String password)? passwordOnChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? signInWithEmail,
    TResult Function(String email)? emailOnChanged,
    TResult Function(String password)? passwordOnChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SignUpWithEmail value) signInWithEmail,
    required TResult Function(_EmailOnChanged value) emailOnChanged,
    required TResult Function(_PasswordOnChanged value) passwordOnChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SignUpWithEmail value)? signInWithEmail,
    TResult? Function(_EmailOnChanged value)? emailOnChanged,
    TResult? Function(_PasswordOnChanged value)? passwordOnChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SignUpWithEmail value)? signInWithEmail,
    TResult Function(_EmailOnChanged value)? emailOnChanged,
    TResult Function(_PasswordOnChanged value)? passwordOnChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpFormEventCopyWith<$Res> {
  factory $SignUpFormEventCopyWith(
          SignUpFormEvent value, $Res Function(SignUpFormEvent) then) =
      _$SignUpFormEventCopyWithImpl<$Res, SignUpFormEvent>;
}

/// @nodoc
class _$SignUpFormEventCopyWithImpl<$Res, $Val extends SignUpFormEvent>
    implements $SignUpFormEventCopyWith<$Res> {
  _$SignUpFormEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignUpFormEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$SignUpFormEventCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignUpFormEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'SignUpFormEvent.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() signInWithEmail,
    required TResult Function(String email) emailOnChanged,
    required TResult Function(String password) passwordOnChanged,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? signInWithEmail,
    TResult? Function(String email)? emailOnChanged,
    TResult? Function(String password)? passwordOnChanged,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? signInWithEmail,
    TResult Function(String email)? emailOnChanged,
    TResult Function(String password)? passwordOnChanged,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SignUpWithEmail value) signInWithEmail,
    required TResult Function(_EmailOnChanged value) emailOnChanged,
    required TResult Function(_PasswordOnChanged value) passwordOnChanged,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SignUpWithEmail value)? signInWithEmail,
    TResult? Function(_EmailOnChanged value)? emailOnChanged,
    TResult? Function(_PasswordOnChanged value)? passwordOnChanged,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SignUpWithEmail value)? signInWithEmail,
    TResult Function(_EmailOnChanged value)? emailOnChanged,
    TResult Function(_PasswordOnChanged value)? passwordOnChanged,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SignUpFormEvent {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$SignUpWithEmailImplCopyWith<$Res> {
  factory _$$SignUpWithEmailImplCopyWith(_$SignUpWithEmailImpl value,
          $Res Function(_$SignUpWithEmailImpl) then) =
      __$$SignUpWithEmailImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignUpWithEmailImplCopyWithImpl<$Res>
    extends _$SignUpFormEventCopyWithImpl<$Res, _$SignUpWithEmailImpl>
    implements _$$SignUpWithEmailImplCopyWith<$Res> {
  __$$SignUpWithEmailImplCopyWithImpl(
      _$SignUpWithEmailImpl _value, $Res Function(_$SignUpWithEmailImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignUpFormEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SignUpWithEmailImpl implements _SignUpWithEmail {
  const _$SignUpWithEmailImpl();

  @override
  String toString() {
    return 'SignUpFormEvent.signInWithEmail()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignUpWithEmailImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() signInWithEmail,
    required TResult Function(String email) emailOnChanged,
    required TResult Function(String password) passwordOnChanged,
  }) {
    return signInWithEmail();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? signInWithEmail,
    TResult? Function(String email)? emailOnChanged,
    TResult? Function(String password)? passwordOnChanged,
  }) {
    return signInWithEmail?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? signInWithEmail,
    TResult Function(String email)? emailOnChanged,
    TResult Function(String password)? passwordOnChanged,
    required TResult orElse(),
  }) {
    if (signInWithEmail != null) {
      return signInWithEmail();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SignUpWithEmail value) signInWithEmail,
    required TResult Function(_EmailOnChanged value) emailOnChanged,
    required TResult Function(_PasswordOnChanged value) passwordOnChanged,
  }) {
    return signInWithEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SignUpWithEmail value)? signInWithEmail,
    TResult? Function(_EmailOnChanged value)? emailOnChanged,
    TResult? Function(_PasswordOnChanged value)? passwordOnChanged,
  }) {
    return signInWithEmail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SignUpWithEmail value)? signInWithEmail,
    TResult Function(_EmailOnChanged value)? emailOnChanged,
    TResult Function(_PasswordOnChanged value)? passwordOnChanged,
    required TResult orElse(),
  }) {
    if (signInWithEmail != null) {
      return signInWithEmail(this);
    }
    return orElse();
  }
}

abstract class _SignUpWithEmail implements SignUpFormEvent {
  const factory _SignUpWithEmail() = _$SignUpWithEmailImpl;
}

/// @nodoc
abstract class _$$EmailOnChangedImplCopyWith<$Res> {
  factory _$$EmailOnChangedImplCopyWith(_$EmailOnChangedImpl value,
          $Res Function(_$EmailOnChangedImpl) then) =
      __$$EmailOnChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$EmailOnChangedImplCopyWithImpl<$Res>
    extends _$SignUpFormEventCopyWithImpl<$Res, _$EmailOnChangedImpl>
    implements _$$EmailOnChangedImplCopyWith<$Res> {
  __$$EmailOnChangedImplCopyWithImpl(
      _$EmailOnChangedImpl _value, $Res Function(_$EmailOnChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignUpFormEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$EmailOnChangedImpl(
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EmailOnChangedImpl implements _EmailOnChanged {
  const _$EmailOnChangedImpl(this.email);

  @override
  final String email;

  @override
  String toString() {
    return 'SignUpFormEvent.emailOnChanged(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailOnChangedImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  /// Create a copy of SignUpFormEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailOnChangedImplCopyWith<_$EmailOnChangedImpl> get copyWith =>
      __$$EmailOnChangedImplCopyWithImpl<_$EmailOnChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() signInWithEmail,
    required TResult Function(String email) emailOnChanged,
    required TResult Function(String password) passwordOnChanged,
  }) {
    return emailOnChanged(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? signInWithEmail,
    TResult? Function(String email)? emailOnChanged,
    TResult? Function(String password)? passwordOnChanged,
  }) {
    return emailOnChanged?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? signInWithEmail,
    TResult Function(String email)? emailOnChanged,
    TResult Function(String password)? passwordOnChanged,
    required TResult orElse(),
  }) {
    if (emailOnChanged != null) {
      return emailOnChanged(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SignUpWithEmail value) signInWithEmail,
    required TResult Function(_EmailOnChanged value) emailOnChanged,
    required TResult Function(_PasswordOnChanged value) passwordOnChanged,
  }) {
    return emailOnChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SignUpWithEmail value)? signInWithEmail,
    TResult? Function(_EmailOnChanged value)? emailOnChanged,
    TResult? Function(_PasswordOnChanged value)? passwordOnChanged,
  }) {
    return emailOnChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SignUpWithEmail value)? signInWithEmail,
    TResult Function(_EmailOnChanged value)? emailOnChanged,
    TResult Function(_PasswordOnChanged value)? passwordOnChanged,
    required TResult orElse(),
  }) {
    if (emailOnChanged != null) {
      return emailOnChanged(this);
    }
    return orElse();
  }
}

abstract class _EmailOnChanged implements SignUpFormEvent {
  const factory _EmailOnChanged(final String email) = _$EmailOnChangedImpl;

  String get email;

  /// Create a copy of SignUpFormEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmailOnChangedImplCopyWith<_$EmailOnChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PasswordOnChangedImplCopyWith<$Res> {
  factory _$$PasswordOnChangedImplCopyWith(_$PasswordOnChangedImpl value,
          $Res Function(_$PasswordOnChangedImpl) then) =
      __$$PasswordOnChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String password});
}

/// @nodoc
class __$$PasswordOnChangedImplCopyWithImpl<$Res>
    extends _$SignUpFormEventCopyWithImpl<$Res, _$PasswordOnChangedImpl>
    implements _$$PasswordOnChangedImplCopyWith<$Res> {
  __$$PasswordOnChangedImplCopyWithImpl(_$PasswordOnChangedImpl _value,
      $Res Function(_$PasswordOnChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignUpFormEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? password = null,
  }) {
    return _then(_$PasswordOnChangedImpl(
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PasswordOnChangedImpl implements _PasswordOnChanged {
  const _$PasswordOnChangedImpl(this.password);

  @override
  final String password;

  @override
  String toString() {
    return 'SignUpFormEvent.passwordOnChanged(password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasswordOnChangedImpl &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, password);

  /// Create a copy of SignUpFormEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PasswordOnChangedImplCopyWith<_$PasswordOnChangedImpl> get copyWith =>
      __$$PasswordOnChangedImplCopyWithImpl<_$PasswordOnChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() signInWithEmail,
    required TResult Function(String email) emailOnChanged,
    required TResult Function(String password) passwordOnChanged,
  }) {
    return passwordOnChanged(password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? signInWithEmail,
    TResult? Function(String email)? emailOnChanged,
    TResult? Function(String password)? passwordOnChanged,
  }) {
    return passwordOnChanged?.call(password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? signInWithEmail,
    TResult Function(String email)? emailOnChanged,
    TResult Function(String password)? passwordOnChanged,
    required TResult orElse(),
  }) {
    if (passwordOnChanged != null) {
      return passwordOnChanged(password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SignUpWithEmail value) signInWithEmail,
    required TResult Function(_EmailOnChanged value) emailOnChanged,
    required TResult Function(_PasswordOnChanged value) passwordOnChanged,
  }) {
    return passwordOnChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SignUpWithEmail value)? signInWithEmail,
    TResult? Function(_EmailOnChanged value)? emailOnChanged,
    TResult? Function(_PasswordOnChanged value)? passwordOnChanged,
  }) {
    return passwordOnChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SignUpWithEmail value)? signInWithEmail,
    TResult Function(_EmailOnChanged value)? emailOnChanged,
    TResult Function(_PasswordOnChanged value)? passwordOnChanged,
    required TResult orElse(),
  }) {
    if (passwordOnChanged != null) {
      return passwordOnChanged(this);
    }
    return orElse();
  }
}

abstract class _PasswordOnChanged implements SignUpFormEvent {
  const factory _PasswordOnChanged(final String password) =
      _$PasswordOnChangedImpl;

  String get password;

  /// Create a copy of SignUpFormEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PasswordOnChangedImplCopyWith<_$PasswordOnChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SignUpFormState {
  RequestState get state => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  /// Create a copy of SignUpFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignUpFormStateCopyWith<SignUpFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpFormStateCopyWith<$Res> {
  factory $SignUpFormStateCopyWith(
          SignUpFormState value, $Res Function(SignUpFormState) then) =
      _$SignUpFormStateCopyWithImpl<$Res, SignUpFormState>;
  @useResult
  $Res call(
      {RequestState state, String message, String email, String password});
}

/// @nodoc
class _$SignUpFormStateCopyWithImpl<$Res, $Val extends SignUpFormState>
    implements $SignUpFormStateCopyWith<$Res> {
  _$SignUpFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignUpFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? message = null,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as RequestState,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignUpFormStateImplCopyWith<$Res>
    implements $SignUpFormStateCopyWith<$Res> {
  factory _$$SignUpFormStateImplCopyWith(_$SignUpFormStateImpl value,
          $Res Function(_$SignUpFormStateImpl) then) =
      __$$SignUpFormStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RequestState state, String message, String email, String password});
}

/// @nodoc
class __$$SignUpFormStateImplCopyWithImpl<$Res>
    extends _$SignUpFormStateCopyWithImpl<$Res, _$SignUpFormStateImpl>
    implements _$$SignUpFormStateImplCopyWith<$Res> {
  __$$SignUpFormStateImplCopyWithImpl(
      _$SignUpFormStateImpl _value, $Res Function(_$SignUpFormStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignUpFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? message = null,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$SignUpFormStateImpl(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as RequestState,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SignUpFormStateImpl implements _SignUpFormState {
  const _$SignUpFormStateImpl(
      {required this.state,
      required this.message,
      required this.email,
      required this.password});

  @override
  final RequestState state;
  @override
  final String message;
  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'SignUpFormState(state: $state, message: $message, email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpFormStateImpl &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, state, message, email, password);

  /// Create a copy of SignUpFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpFormStateImplCopyWith<_$SignUpFormStateImpl> get copyWith =>
      __$$SignUpFormStateImplCopyWithImpl<_$SignUpFormStateImpl>(
          this, _$identity);
}

abstract class _SignUpFormState implements SignUpFormState {
  const factory _SignUpFormState(
      {required final RequestState state,
      required final String message,
      required final String email,
      required final String password}) = _$SignUpFormStateImpl;

  @override
  RequestState get state;
  @override
  String get message;
  @override
  String get email;
  @override
  String get password;

  /// Create a copy of SignUpFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignUpFormStateImplCopyWith<_$SignUpFormStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
