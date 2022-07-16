// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'steps.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Steps {
  int get count => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StepsCopyWith<Steps> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StepsCopyWith<$Res> {
  factory $StepsCopyWith(Steps value, $Res Function(Steps) then) =
      _$StepsCopyWithImpl<$Res>;
  $Res call({int count});
}

/// @nodoc
class _$StepsCopyWithImpl<$Res> implements $StepsCopyWith<$Res> {
  _$StepsCopyWithImpl(this._value, this._then);

  final Steps _value;
  // ignore: unused_field
  final $Res Function(Steps) _then;

  @override
  $Res call({
    Object? count = freezed,
  }) {
    return _then(_value.copyWith(
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_StepsCopyWith<$Res> implements $StepsCopyWith<$Res> {
  factory _$$_StepsCopyWith(_$_Steps value, $Res Function(_$_Steps) then) =
      __$$_StepsCopyWithImpl<$Res>;
  @override
  $Res call({int count});
}

/// @nodoc
class __$$_StepsCopyWithImpl<$Res> extends _$StepsCopyWithImpl<$Res>
    implements _$$_StepsCopyWith<$Res> {
  __$$_StepsCopyWithImpl(_$_Steps _value, $Res Function(_$_Steps) _then)
      : super(_value, (v) => _then(v as _$_Steps));

  @override
  _$_Steps get _value => super._value as _$_Steps;

  @override
  $Res call({
    Object? count = freezed,
  }) {
    return _then(_$_Steps(
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Steps implements _Steps {
  const _$_Steps({required this.count});

  @override
  final int count;

  @override
  String toString() {
    return 'Steps(count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Steps &&
            const DeepCollectionEquality().equals(other.count, count));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(count));

  @JsonKey(ignore: true)
  @override
  _$$_StepsCopyWith<_$_Steps> get copyWith =>
      __$$_StepsCopyWithImpl<_$_Steps>(this, _$identity);
}

abstract class _Steps implements Steps {
  const factory _Steps({required final int count}) = _$_Steps;

  @override
  int get count => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_StepsCopyWith<_$_Steps> get copyWith =>
      throw _privateConstructorUsedError;
}
