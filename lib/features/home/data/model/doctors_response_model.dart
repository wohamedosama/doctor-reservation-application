import 'package:json_annotation/json_annotation.dart';

part 'doctors_response_model.g.dart';

@JsonSerializable()
class DoctorsResponseModel {
  @JsonKey(name: 'data')
  List<DocotrsModel?>? docotrsModel;
  DoctorsResponseModel({
    this.docotrsModel,
  });

  factory DoctorsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$DoctorsResponseModelFromJson(json);
}

@JsonSerializable()
class DocotrsModel {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? photo;
  String? gender;
  String? address;
  String? description;
  String? degree;
  @JsonKey(name: 'appoint_price')
  int? price;
  Specialization? specialization;
  DocotrsModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.photo,
    this.gender,
    this.address,
    this.description,
    this.degree,
    this.price,
    this.specialization,
  });
  factory DocotrsModel.fromJson(Map<String, dynamic> json) =>
      _$DocotrdModelFromJson(json);
}

@JsonSerializable()
class Specialization {
  int? id;
  String? name;
  Specialization({
    this.id,
    this.name,
  });
  factory Specialization.fromJson(Map<String, dynamic> json) =>
      _$SpecializationFromJson(json);
}
