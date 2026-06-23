import 'package:flutter/material.dart';
import '../../../../data/entity/EmergencyContact.dart';


class EmergencyScreen extends StatelessWidget {
  EmergencyScreen({super.key});

  final List<EmergencyContact> contacts = [
    EmergencyContact(
      name: "Ambulance",
      number: "108",
      icon: Icons.local_hospital,
      color: Colors.red,
    ),
    EmergencyContact(
      name: "Police",
      number: "100",
      icon: Icons.local_police,
      color: Colors.blue,
    ),
    EmergencyContact(
      name: "Fire Brigade",
      number: "101",
      icon: Icons.fire_truck,
      color: Colors.orange,
    ),
    EmergencyContact(
      name: "Women Helpline",
      number: "1091",
      icon: Icons.support_agent,
      color: Colors.purple,
    ),
    EmergencyContact(
      name: "Disaster Management",
      number: "1078",
      icon: Icons.warning,
      color: Colors.brown,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Emergency Help"),
        
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: contact.color.withOpacity(0.2),
                child: Icon(contact.icon, color: contact.color),
              ),
              title: Text(contact.name),
              subtitle: Text(contact.number),
              trailing: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: contact.color,
                ),
                onPressed: () {},
                child: const Text("CALL"),
              ),
            ),
          );
        },
      ),
    );
  }
}