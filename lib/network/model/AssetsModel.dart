import 'package:json_annotation/json_annotation.dart';

part 'AssetsModel.g.dart';

@JsonSerializable(nullable: false)
class AssetsModel {
  AssetsModel(this.id, this.type);
  factory AssetsModel.fromMap(Map<String, dynamic> json) => _$AssetsModelFromJson(json);
  Map<String, dynamic> toMap() => _$AssetsModelToJson(this);

  final String id;
  final int type;

  @override
  String toString() {
    return 'User email: $id and name: $type';
  }
}