import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            backgroundColor: Colors.teal,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF0F766E),
                      Color(0xFF14B8A6),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 40),
                    CircleAvatar(
                      radius: 45,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.person,
                        size: 50,
                        color: Colors.teal,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      "John Doe",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Patient ID: HC123456",
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: [

            ],
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _sectionTitle("Personal Information"),
                  const SizedBox(height: 10),

                  _infoCard(
                    children: const [
                      InfoRow("Age", "32 Years"),
                      InfoRow("Gender", "Male"),
                      InfoRow("Blood Group", "O+"),
                      InfoRow("Phone", "+91 9876543210"),
                    ],
                  ),

                  const SizedBox(height: 20),

                  _sectionTitle("Health Summary"),

                  const SizedBox(height: 10),

                  Row(
                    children: [
                      Expanded(
                        child: _statCard(
                          Icons.favorite,
                          "Heart Rate",
                          "72 bpm",
                          Colors.red,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _statCard(
                          Icons.monitor_heart,
                          "Blood Pressure",
                          "120/80",
                          Colors.blue,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  Row(
                    children: [
                      Expanded(
                        child: _statCard(
                          Icons.scale,
                          "BMI",
                          "23.5",
                          Colors.orange,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _statCard(
                          Icons.water_drop,
                          "Blood Type",
                          "O+",
                          Colors.purple,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  _sectionTitle("Medical Records"),

                  const SizedBox(height: 10),

                  _menuTile(
                    Icons.description,
                    "Lab Reports",
                  ),

                  _menuTile(
                    Icons.medication,
                    "Prescriptions",
                  ),

                  _menuTile(
                    Icons.vaccines,
                    "Vaccination History",
                  ),

                  const SizedBox(height: 20),

                  _sectionTitle("Settings"),

                  const SizedBox(height: 10),

                  _menuTile(
                    Icons.notifications,
                    "Notifications",
                  ),

                  _menuTile(
                    Icons.security,
                    "Privacy & Security",
                  ),

                  _menuTile(
                    Icons.contact_phone,
                    "Emergency Contact",
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _infoCard({required List<Widget> children}) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: children),
      ),
    );
  }

  Widget _statCard(
      IconData icon,
      String title,
      String value,
      Color color,
      ) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
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

  Widget _menuTile(
      IconData icon,
      String title,
      ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Icon(icon, color: Colors.teal),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {},
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String title;
  final String value;

  const InfoRow(
      this.title,
      this.value, {
        super.key,
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
