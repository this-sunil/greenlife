import 'package:flutter/material.dart';
class HealthRecordModel {
  final String date;
  final String doctor;
  final String hospital;
  final String diagnosis;
  final String prescription;
  final Color color;

  HealthRecordModel({
    required this.date,
    required this.doctor,
    required this.hospital,
    required this.diagnosis,
    required this.prescription,
    required this.color,
  });
}