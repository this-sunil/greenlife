import 'package:flutter/material.dart';
import 'package:greenlife/layer/widget/CustomText.dart';

import '../../../pages/HealthRecordModel.dart';

class HealthRecordScreen extends StatelessWidget {
  HealthRecordScreen({super.key});

  final List<HealthRecordModel> records = [
    HealthRecordModel(
      date: "10 Jan 2026",
      doctor: "Dr. Sharma",
      hospital: "City Hospital",
      diagnosis: "Fever & Cold",
      prescription: "Paracetamol, Rest",
      color: Colors.blue,
    ),
    HealthRecordModel(
      date: "25 Feb 2026",
      doctor: "Dr. Patil",
      hospital: "LifeCare Clinic",
      diagnosis: "Stomach Infection",
      prescription: "Antibiotics, ORS",
      color: Colors.orange,
    ),
    HealthRecordModel(
      date: "12 Mar 2026",
      doctor: "Dr. Desai",
      hospital: "Apollo Clinic",
      diagnosis: "Blood Pressure Check",
      prescription: "Amlodipine",
      color: Colors.red,
    ),
    HealthRecordModel(
      date: "05 Apr 2026",
      doctor: "Dr. Khan",
      hospital: "Wellness Hospital",
      diagnosis: "Vitamin Deficiency",
      prescription: "Vitamin D3 Tablets",
      color: Colors.green,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(title:"Health Records"),
      ),
      body: Column(
        children: [


          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: records.length,
              itemBuilder: (context, index) {
                final record = records[index];

                return Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: record.color.withOpacity(0.15),
                            child: Icon(
                              Icons.medical_services,
                              color: record.color,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                record.doctor,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                record.hospital,
                                style: TextStyle(color: Colors.grey.shade600),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Text(
                            record.date,
                            style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      Text(
                        "Diagnosis: ${record.diagnosis}",
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 5),
                      Text("Prescription: ${record.prescription}"),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
