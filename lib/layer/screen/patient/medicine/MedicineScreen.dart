import 'package:flutter/material.dart';
import 'package:greenlife/layer/widget/CustomText.dart';
import 'package:solar_icons/solar_icons.dart';

class MedicineScreen extends StatelessWidget {
  const MedicineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final medicines = [
      {'name': 'Paracetamol', 'dosage': '500 mg', 'time': 'Morning'},
      {'name': 'Ibuprofen', 'dosage': '200 mg', 'time': 'Afternoon'},
      {'name': 'Amoxicillin', 'dosage': '250 mg', 'time': 'Night'},
      {'name': 'Vitamin D3', 'dosage': '1000 IU', 'time': 'Morning'},
    ];

    return Scaffold(

      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        backgroundColor: Colors.teal,
        title:CustomText(
          title:"My Medicines",
          weight: .bold,
          textColor: Colors.white,
        ),
        centerTitle: true,
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: medicines.length,
        itemBuilder: (context, index) {
          final m = medicines[index];

          return Container(
            margin: const EdgeInsets.only(bottom: 14),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),

              // Modern shadow
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),

            child: Row(
              children: [
                // Icon container (modern style)
                Container(
                  height: 58,
                  width: 58,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF00C9A7), Color(0xFF1DE9B6)],
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(
                    SolarIconsOutline.medicalKit,
                    color: Colors.white,
                    size: 26,
                  ),
                ),

                const SizedBox(width: 14),

                // Info section
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        m['name'].toString(),
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),

                      Text(
                        "💊 Dosage: ${m['dosage']}",
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 13,
                        ),
                      ),

                      const SizedBox(height: 4),

                      Text(
                        "⏰ Time: ${m['time']}",
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),

                // Action button (modern pill style)
                InkWell(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("🔔 Reminder set for ${m['name']}"),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.teal.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          SolarIconsOutline.bell,
                          color: Colors.teal,
                          size: 20,
                        ),
                        SizedBox(width: 6),
                        Text(
                          "Set",
                          style: TextStyle(
                            color: Colors.teal,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}