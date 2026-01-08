import 'package:json_annotation/json_annotation.dart';
part 'specialization_response_model.g.dart';

@JsonSerializable()
class SpecializationResponseModel {
  @JsonKey(name: 'data')
  List<SpecializationsData?>? specializationsData;
  SpecializationResponseModel({this.specializationsData});
  factory SpecializationResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SpecializationResponseModelFromJson(json);
}

@JsonSerializable()
class SpecializationsData {
  int? id;
  @JsonKey(name: 'name')
  String? specialityCatgory;
  @JsonKey(name: 'doctors')
  List<DoctorsModel?>? doctorsModel;
  SpecializationsData({this.id, this.specialityCatgory, this.doctorsModel});
  factory SpecializationsData.fromJson(Map<String, dynamic> json) =>
      _$SpecializationsDataFromJson(json);
}

@JsonSerializable()
class DoctorsModel {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? photo;
  String? gender;
  String? degree;
  @JsonKey(name: 'appoint_price')
  int? price;
  DoctorsModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.photo,
    this.gender,
    this.degree,
    this.price,
  });

  factory DoctorsModel.fromJson(Map<String, dynamic> json) =>
      _$DoctorsModelFromJson(json);
}
