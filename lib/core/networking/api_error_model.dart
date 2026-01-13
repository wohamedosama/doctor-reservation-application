import 'package:doctor_reservation_app/core/helpers/extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  final String? message;
  final int? code;
  @JsonKey(name: 'data')
  final Map<String, dynamic>? errors;

  ApiErrorModel({
    this.message,
    this.code,
    this.errors,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);

  /// Returns a String containing all error messages.
  String getAllErrorMessages() {
    if (errors.isNullOrEmpty()) return message ?? "Unknown error occurred";

    try {
      return errors!.entries.map((entry) {
        final value = entry.value;
        if (value is List) {
          return value.join(', ');
        }
        return value.toString();
      }).join('\n');
    } catch (e) {
      return message ?? "Unknown error occurred";
    }
  }
}
