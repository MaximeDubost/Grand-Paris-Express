// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:grand_paris_express/features/main/domain/entities/section.dart';

class Line {
  final String id;
  final String name;
  final String type;
  final String icon;
  final List<String> terminusList;
  final List<Section> sectionList;

  Line(
    this.id,
    this.name,
    this.type,
    this.icon,
    this.terminusList,
    this.sectionList,
  );
  
  Line copyWith({
    String? id,
    String? name,
    String? type,
    String? icon,
    List<String>? terminusList,
    List<Section>? sectionList,
  }) {
    return Line(
      id ?? this.id,
      name ?? this.name,
      type ?? this.type,
      icon ?? this.icon,
      terminusList ?? this.terminusList,
      sectionList ?? this.sectionList,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'type': type,
      'icon': icon,
      'terminusList': terminusList,
      'sectionList': sectionList.map((x) => x.toMap()).toList(),
    };
  }

  factory Line.fromMap(Map<String, dynamic> map) {
    return Line(
      map['id'] as String,
      map['name'] as String,
      map['type'] as String,
      map['icon'] as String,
      List<String>.from((map['terminusList'] as List<String>)),
      List<Section>.from((map['sectionList'] as List<int>).map<Section>((x) => Section.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory Line.fromJson(String source) => Line.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Line(id: $id, name: $name, type: $type, icon: $icon, terminusList: $terminusList, sectionList: $sectionList)';
  }

  @override
  bool operator ==(covariant Line other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.type == type &&
      other.icon == icon &&
      listEquals(other.terminusList, terminusList) &&
      listEquals(other.sectionList, sectionList);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      type.hashCode ^
      icon.hashCode ^
      terminusList.hashCode ^
      sectionList.hashCode;
  }
}
