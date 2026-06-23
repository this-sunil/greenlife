import 'package:flutter/material.dart';

class HealthPage extends StatelessWidget {
  const HealthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: const Text("My Health"),
        centerTitle: true,
        backgroundColor: const Color(0xFF16A34A),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Health Score Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF16A34A),
                    Color(0xFF22C55E),
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                children: [
                  Text(
                    "Health Score",
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "92%",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Excellent",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              "Today's Health",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.3,
              children: const [
                HealthCard(
                  icon: Icons.favorite,
                  color: Colors.red,
                  title: "Heart Rate",
                  value: "72 BPM",
                ),
                HealthCard(
                  icon: Icons.monitor_heart,
                  color: Colors.blue,
                  title: "Blood Pressure",
                  value: "120/80",
                ),
                HealthCard(
                  icon: Icons.local_fire_department,
                  color: Colors.orange,
                  title: "Calories",
                  value: "1850",
                ),
                HealthCard(
                  icon: Icons.directions_walk,
                  color: Colors.green,
                  title: "Steps",
                  value: "7,542",
                ),
              ],
            ),

            const SizedBox(height: 24),

            const Text(
              "Body Metrics",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    MetricRow(
                      title: "Height",
                      value: "175 cm",
                    ),
                    Divider(),
                    MetricRow(
                      title: "Weight",
                      value: "72 kg",
                    ),
                    Divider(),
                    MetricRow(
                      title: "BMI",
                      value: "23.5",
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              "Medications",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Color(0xFFE8F5E9),
                  child: Icon(
                    Icons.medication,
                    color: Color(0xFF16A34A),
                  ),
                ),
                title: Text("Vitamin D"),
                subtitle: Text("1 Tablet after breakfast"),
                trailing: Icon(Icons.check_circle,
                    color: Colors.green),
              ),
            ),

            Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Color(0xFFE8F5E9),
                  child: Icon(
                    Icons.medication,
                    color: Color(0xFF16A34A),
                  ),
                ),
                title: Text("Omega 3"),
                subtitle: Text("1 Capsule after lunch"),
                trailing: Icon(Icons.schedule,
                    color: Colors.orange),
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              "Health Tips",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.lightbulb,
                    color: Color(0xFF16A34A),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      "Drink at least 8 glasses of water today and walk 30 minutes.",
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class HealthCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String value;

  const HealthCard({
    super.key,
    required this.icon,
    required this.color,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 32),
            const SizedBox(height: 10),
            Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(title),
          ],
        ),
      ),
    );
  }
}

class MetricRow extends StatelessWidget {
  final String title;
  final String value;

  const MetricRow({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title),
        const Spacer(),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}