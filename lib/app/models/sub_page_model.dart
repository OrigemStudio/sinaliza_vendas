// To parse this JSON data, do
//
//     final subPageModel = subPageModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';

SubPageModel subPageModelFromJson(String str) =>
    SubPageModel.fromJson(json.decode(str));

String subPageModelToJson(SubPageModel data) => json.encode(data.toJson());

class SubPageModel {
  SubPageModel({
    this.title,
    this.page,
  });

  String title;
  dynamic page;

  SubPageModel copyWith({
    String title,
    dynamic page,
  }) =>
      SubPageModel(
        title: title ?? this.title,
        page: page ?? this.page,
      );

  factory SubPageModel.fromJson(Map<String, dynamic> json) => SubPageModel(
        title: json["title"] == null ? null : json["title"],
        page: json["page"] == null ? null : json["page"],
      );

  Map<String, dynamic> toJson() => {
        "title": title == null ? null : title,
        "page": page == null ? null : page,
      };
}
