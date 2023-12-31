import 'package:json_annotation/json_annotation.dart';

part 'info.g.dart';

@JsonSerializable()
class Info{
  Info({required this.count, required this.pages, required this.next, required this.prev});
  int count;
  int pages;
  dynamic next;
  dynamic prev;



  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);

  Map<String, dynamic> toJson() => _$InfoToJson(this);
}