import 'package:flutter/material.dart';
import 'package:greenlife/layer/widget/CustomText.dart';
import 'package:solar_icons/solar_icons.dart';

class MedicineScreen extends StatelessWidget {
  const MedicineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final medicines = [
      {'name': 'Paracetamol', 'dosage': '500 mg', 'time': 'Morning', 'status': 'Pending'},
      {'name': 'Ibuprofen', 'dosage': '200 mg', 'time': 'Afternoon', 'status': 'Upcoming'},
      {'name': 'Amoxicillin', 'dosage': '250 mg', 'time': 'Night', 'status': 'Upcoming'},
      {'name': 'Vitamin D3', 'dosage': '1000 IU', 'time': 'Morning', 'status': 'Taken'},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC), // Soft modern background
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.teal,
        elevation: 0,
        centerTitle: true,
        title: const CustomText(
          title: "My Medicines",
          weight: .bold,
          textColor: Colors.white,
        ),
      ),
      body: Column(
        children: [
          // Top Header Section
          Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
            decoration: const BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Today's Schedule",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "4 Medicines Reminders",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(
                    SolarIconsOutline.calendar,
                    color: Colors.white,
                    size: 28,
                  ),
                )
              ],
            ),
          ),

          // Medicine List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
              itemCount: medicines.length,
              itemBuilder: (context, index) {
                final m = medicines[index];
                bool isTaken = m['status'] == 'Taken';

                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey.shade100, width: 1.5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.teal.withOpacity(0.05),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                        spreadRadius: -2,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      // Icon Container with Gradient and Shadow
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: isTaken
                                ? [Colors.grey.shade400, Colors.grey.shade500]
                                : [const Color(0xFF00C9A7), const Color(0xFF00BFA5)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              color: isTaken
                                  ? Colors.grey.withOpacity(0.2)
                                  : const Color(0xFF00C9A7).withOpacity(0.3),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            )
                          ],
                        ),
                        child: Icon(
                          isTaken ? SolarIconsOutline.checkCircle : SolarIconsOutline.pill,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),

                      const SizedBox(width: 16),

                      // Info Section
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              m['name'].toString(),
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade800,
                                decoration: isTaken ? TextDecoration.lineThrough : TextDecoration.none,
                                decorationColor: Colors.grey,
                                decorationThickness: 2,
                              ),
                            ),
                            const SizedBox(height: 10),

                            // Chips for Dosage and Time
                            Row(
                              children: [
                                _buildInfoChip(
                                  context,
                                  icon: SolarIconsOutline.danger,
                                  text: m['dosage'].toString(),
                                  bgColor: Colors.teal.shade50,
                                  textColor: Colors.teal.shade700,
                                ),
                                const SizedBox(width: 8),
                                _buildInfoChip(
                                  context,
                                  icon: SolarIconsOutline.clockCircle,
                                  text: m['time'].toString(),
                                  bgColor: Colors.orange.shade50,
                                  textColor: Colors.orange.shade700,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // Action Button
                      if (!isTaken)
                        InkWell(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Reminder set for ${m['name']}"),
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Colors.teal,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            );
                          },
                          borderRadius: BorderRadius.circular(16),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFF00C9A7), Color(0xFF00BFA5)],
                              ),
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFF00C9A7).withOpacity(0.3),
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                )
                              ],
                            ),
                            child: const Row(
                              children: [
                                Icon(
                                  SolarIconsOutline.bell,
                                  color: Colors.white,
                                  size: 18,
                                ),
                                SizedBox(width: 6),
                                Text(
                                  "Set",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
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
          ),
        ],
      ),
    );
  }

  // Helper widget for modern small info chips
  Widget _buildInfoChip(BuildContext context, {required IconData icon, required String text, required Color bgColor, required Color textColor}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: textColor),
          const SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}