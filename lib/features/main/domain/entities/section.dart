// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:grand_paris_express/features/main/domain/entities/station.dart';

class Section {
  final String id;
  final String name;
  final Station from;
  final Station to;
  final List<Station> stationList;

  Section(
    this.id,
    this.name,
    this.from,
    this.to,
    this.stationList,
  );


  Section copyWith({
    String? id,
    String? name,
    Station? from,
    Station? to,
    List<Station>? stationList,
  }) {
    return Section(
      id ?? this.id,
      name ?? this.name,
      from ?? this.from,
      to ?? this.to,
      stationList ?? this.stationList,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'from': from.toMap(),
      'to': to.toMap(),
      'stationList': stationList.map((x) => x.toMap()).toList(),
    };
  }

  factory Section.fromMap(Map<String, dynamic> map) {
    return Section(
      map['id'] as String,
      map['name'] as String,
      Station.fromMap(map['from'] as Map<String,dynamic>),
      Station.fromMap(map['to'] as Map<String,dynamic>),
      List<Station>.from((map['stationList'] as List<int>).map<Station>((x) => Station.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory Section.fromJson(String source) => Section.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Section(id: $id, name: $name, from: $from, to: $to, stationList: $stationList)';
  }

  @override
  bool operator ==(covariant Section other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.from == from &&
      other.to == to &&
      listEquals(other.stationList, stationList);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      from.hashCode ^
      to.hashCode ^
      stationList.hashCode;
  }
}
