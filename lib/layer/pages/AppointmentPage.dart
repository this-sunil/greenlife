import 'package:flutter/material.dart';

import '../widget/CustomText.dart';



class AppointmentPage extends StatelessWidget {
  const AppointmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,

        appBar: AppBar(
          title: const CustomText(title:"Appointments"),
          centerTitle: true,
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          bottom: TabBar(
            indicatorColor: Colors.white,
            dividerColor: Colors.transparent,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
            tabs: const [
              Tab(text: "Upcoming"),
              Tab(text: "Previous"),
            ],
          ),
        ),

        body: const TabBarView(
          children: [
            UpcomingAppointments(),
            PreviousAppointments(),
          ],
        ),

        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.green,
          onPressed: () {},
          icon: const Icon(Icons.add),
          label: const CustomText(title:"Book"),
        ),
      ),
    );
  }
}

class UpcomingAppointments extends StatelessWidget {
  const UpcomingAppointments({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),

      children: const [
        AppointmentCard(
          doctor: "Dr. Amit Sharma",
          specialization: "Cardiologist",
          date: "25 Jun 2026",
          time: "10:00 AM",
          upcoming: true,
        ),
        AppointmentCard(
          doctor: "Dr. Sneha Patil",
          specialization: "Dentist",
          date: "28 Jun 2026",
          time: "02:30 PM",
          upcoming: true,
        ),
      ],
    );
  }
}

class PreviousAppointments extends StatelessWidget {
  const PreviousAppointments({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        AppointmentCard(
          doctor: "Dr. Raj Patil",
          specialization: "General Physician",
          date: "10 Jun 2026",
          time: "11:00 AM",
          upcoming: false,
        ),
        AppointmentCard(
          doctor: "Dr. Meera Shah",
          specialization: "Dermatologist",
          date: "28 May 2026",
          time: "04:00 PM",
          upcoming: false,
        ),
      ],
    );
  }
}

class AppointmentCard extends StatelessWidget {
  final String doctor;
  final String specialization;
  final String date;
  final String time;
  final bool upcoming;

  const AppointmentCard({
    super.key,
    required this.doctor,
    required this.specialization,
    required this.date,
    required this.time,
    required this.upcoming,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 28,
                  backgroundColor: Color(0xFFE8F5E9),
                  child: Icon(
                    Icons.person,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(width: 12),

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      CustomText(title:
                        doctor,

                          size: 16,
                          weight: FontWeight.bold,


                      ),
                      CustomText(title:
                        specialization,
                        textColor: Colors.grey,
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: upcoming
                        ? Colors.green.shade100
                        : Colors.grey.shade200,
                    borderRadius:
                    BorderRadius.circular(20),
                  ),
                  child: CustomText(title:
                    upcoming
                        ? "Upcoming"
                        : "Completed",
                    textColor: Colors.black,
                  ),
                )
              ],
            ),

            const SizedBox(height: 15),

            Row(
              children: [
                const Icon(
                  Icons.calendar_month,
                  color: Colors.green,
                ),
                const SizedBox(width: 8),
                CustomText(title:date),

                const Spacer(),

                const Icon(
                  Icons.access_time,
                  color: Colors.green,
                ),
                const SizedBox(width: 8),
                CustomText(title:time),
              ],
            ),

            if (upcoming) ...[
              const SizedBox(height: 15),

              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink,
                      ),
                      onPressed: () {},
                      child: const CustomText(title:"Reschedule"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      onPressed: () {},
                      child: const CustomText(title:"Details"),
                    ),
                  ),
                ],
              ),
            ]
          ],
        ),
      ),
    );
  }
}
