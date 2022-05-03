// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_screen_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeScreenState {
  bool get isLoading =>
      throw _privateConstructorUsedError; // @Default(AsyncValue.loading()) AsyncValue<List<CallHistory>> callHistory,
  AsyncValue<List<Todo>> get todoList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeScreenStateCopyWith<HomeScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeScreenStateCopyWith<$Res> {
  factory $HomeScreenStateCopyWith(
          HomeScreenState value, $Res Function(HomeScreenState) then) =
      _$HomeScreenStateCopyWithImpl<$Res>;
  $Res call({bool isLoading, AsyncValue<List<Todo>> todoList});
}

/// @nodoc
class _$HomeScreenStateCopyWithImpl<$Res>
    implements $HomeScreenStateCopyWith<$Res> {
  _$HomeScreenStateCopyWithImpl(this._value, this._then);

  final HomeScreenState _value;
  // ignore: unused_field
  final $Res Function(HomeScreenState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? todoList = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      todoList: todoList == freezed
          ? _value.todoList
          : todoList // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<Todo>>,
    ));
  }
}

/// @nodoc
abstract class _$HomeScreenStateCopyWith<$Res>
    implements $HomeScreenStateCopyWith<$Res> {
  factory _$HomeScreenStateCopyWith(
          _HomeScreenState value, $Res Function(_HomeScreenState) then) =
      __$HomeScreenStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isLoading, AsyncValue<List<Todo>> todoList});
}

/// @nodoc
class __$HomeScreenStateCopyWithImpl<$Res>
    extends _$HomeScreenStateCopyWithImpl<$Res>
    implements _$HomeScreenStateCopyWith<$Res> {
  __$HomeScreenStateCopyWithImpl(
      _HomeScreenState _value, $Res Function(_HomeScreenState) _then)
      : super(_value, (v) => _then(v as _HomeScreenState));

  @override
  _HomeScreenState get _value => super._value as _HomeScreenState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? todoList = freezed,
  }) {
    return _then(_HomeScreenState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      todoList: todoList == freezed
          ? _value.todoList
          : todoList // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<Todo>>,
    ));
  }
}

/// @nodoc

class _$_HomeScreenState implements _HomeScreenState {
  const _$_HomeScreenState(
      {this.isLoading = false, this.todoList = const AsyncValue.loading()});

  @override
  @JsonKey()
  final bool isLoading;
// @Default(AsyncValue.loading()) AsyncValue<List<CallHistory>> callHistory,
  @override
  @JsonKey()
  final AsyncValue<List<Todo>> todoList;

  @override
  String toString() {
    return 'HomeScreenState(isLoading: $isLoading, todoList: $todoList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HomeScreenState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.todoList, todoList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(todoList));

  @JsonKey(ignore: true)
  @override
  _$HomeScreenStateCopyWith<_HomeScreenState> get copyWith =>
      __$HomeScreenStateCopyWithImpl<_HomeScreenState>(this, _$identity);
}

abstract class _HomeScreenState implements HomeScreenState {
  const factory _HomeScreenState(
      {final bool isLoading,
      final AsyncValue<List<Todo>> todoList}) = _$_HomeScreenState;

  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override // @Default(AsyncValue.loading()) AsyncValue<List<CallHistory>> callHistory,
  AsyncValue<List<Todo>> get todoList => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$HomeScreenStateCopyWith<_HomeScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
