import 'package:json_annotation/json_annotation.dart';

part 'singup_request_body.g.dart';

@JsonSerializable()
class SignupRequestBody {
  String name;
  String email;
  String phone;
  String password;
  @JsonKey(name: 'password_confirmation')
  String passwordConfirmation;
  int gender;

  SignupRequestBody({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.passwordConfirmation,
    required this.gender,
  });
  Map<String, dynamic> toJson() => _$SignupRequestBodyToJson(this);
}
