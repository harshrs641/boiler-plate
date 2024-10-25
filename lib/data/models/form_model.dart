// To parse this JSON data, do
//
//     final formModel = formModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'form_model.freezed.dart';
part 'form_model.g.dart';

FormModel formModelFromJson(String str) => FormModel.fromJson(json.decode(str));

String formModelToJson(FormModel data) => json.encode(data.toJson());

@freezed
class FormModel with _$FormModel {
  const factory FormModel({
    String? name,
    int? age,
    String? gender,
  }) = _FormModel;

  factory FormModel.fromJson(Map<String, dynamic> json) =>
      _$FormModelFromJson(json);
}
