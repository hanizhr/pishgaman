import 'package:flutter_application_3/features/barbari/domain/entities/barbari.dart';

class BarbarModel extends Barbari {
  BarbarModel({
    required super.title,
    required super.weight,
    super.badge
  });
  factory BarbarModel.fromJson (Map<String,dynamic> json){
      return BarbarModel(
        title: json['title'],
        weight: json['weight'],
        badge: json['badge']
      );
  }
}