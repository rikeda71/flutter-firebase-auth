import 'package:freezed_annotation/freezed_annotation.dart';

part 'steps.freezed.dart';

@freezed
class Steps with _$Steps {
  const factory Steps({required int count}) = _Steps;
}
