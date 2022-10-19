// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Station {
  final String id;
  final String name;
  final String state;
  final List<String> lineIdList;

  Station(
    this.id,
    this.name,
    this.state,
    this.lineIdList,
  );

  Station copyWith({
    String? id,
    String? name,
    String? state,
    List<String>? lineIdList,
  }) {
    return Station(
      id ?? this.id,
      name ?? this.name,
      state ?? this.state,
      lineIdList ?? this.lineIdList,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'state': state,
      'lineIdList': lineIdList,
    };
  }

  factory Station.fromMap(Map<String, dynamic> map) {
    return Station(
      map['id'] as String,
      map['name'] as String,
      map['state'] as String,
      List<String>.from(
        (map['lineIdList'] as List<String>),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Station.fromJson(String source) =>
      Station.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Station(id: $id, name: $name, state: $state, lineIdList: $lineIdList)';
  }

  @override
  bool operator ==(covariant Station other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.state == state &&
        listEquals(other.lineIdList, lineIdList);
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ state.hashCode ^ lineIdList.hashCode;
  }
}
