class UpcomingAppointment {
  final String doctorName;
  final String specialization;
  final String appointmentTime;
  final String address;
  final String imageUrl;

  const UpcomingAppointment({
    required this.doctorName,
    required this.specialization,
    required this.appointmentTime,
    required this.address,
    required this.imageUrl,
  });

  factory UpcomingAppointment.fromJson(Map<String, dynamic> json) {
    return UpcomingAppointment(
      doctorName: json['doctorName'] ?? '',
      specialization: json['specialization'] ?? '',
      appointmentTime: json['appointmentTime'] ?? '',
      address: json['address'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'doctorName': doctorName,
      'specialization': specialization,
      'appointmentTime': appointmentTime,
      'address': address,
      'imageUrl': imageUrl,
    };
  }

  static List<UpcomingAppointment> appointments = [
    UpcomingAppointment(
      doctorName: 'Dr. Arjun Mehta',
      specialization: 'Cardiologist',
      appointmentTime: 'Tomorrow, 10:20 AM',
      address: 'Pune, Maharashtra - 411046',
      imageUrl: 'https://static.vecteezy.com/system/resources/thumbnails/026/375/249/small/ai-generative-portrait-of-confident-male-doctor-in-white-coat-and-stethoscope-standing-with-arms-crossed-and-looking-at-camera-photo.jpg',
    ),
    UpcomingAppointment(
      doctorName: 'Dr. Priya Sharma',
      specialization: 'Dermatologist',
      appointmentTime: '25 Jun, 11:30 AM',
      address: 'Mumbai, Maharashtra - 400001',
      imageUrl: 'https://images.unsplash.com/photo-1559839734-2b71ea197ec2',
    ),
    UpcomingAppointment(
      doctorName: 'Dr. Rajesh Verma',
      specialization: 'Neurologist',
      appointmentTime: '26 Jun, 09:00 AM',
      address: 'Nagpur, Maharashtra - 440001',
      imageUrl: 'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d',
    ),
    UpcomingAppointment(
      doctorName: 'Dr. Sneha Patil',
      specialization: 'Pediatrician',
      appointmentTime: '26 Jun, 02:15 PM',
      address: 'Kolhapur, Maharashtra - 416003',
      imageUrl: 'https://images.unsplash.com/photo-1594824476967-48c8b964273f',
    ),
    UpcomingAppointment(
      doctorName: 'Dr. Amit Kulkarni',
      specialization: 'Orthopedic Surgeon',
      appointmentTime: '27 Jun, 10:45 AM',
      address: 'Nashik, Maharashtra - 422001',
      imageUrl: 'https://images.unsplash.com/photo-1622253692010-333f2da6031d',
    ),
    UpcomingAppointment(
      doctorName: 'Dr. Neha Joshi',
      specialization: 'Gynecologist',
      appointmentTime: '27 Jun, 04:00 PM',
      address: 'Thane, Maharashtra - 400601',
      imageUrl: 'https://images.unsplash.com/photo-1651008376811-b90baee60c1f',
    ),
    UpcomingAppointment(
      doctorName: 'Dr. Vikram Singh',
      specialization: 'ENT Specialist',
      appointmentTime: '28 Jun, 08:30 AM',
      address: 'Aurangabad, Maharashtra - 431001',
      imageUrl: 'https://images.unsplash.com/photo-1582750433449-648ed127bb54',
    ),
    UpcomingAppointment(
      doctorName: 'Dr. Pooja Deshmukh',
      specialization: 'Ophthalmologist',
      appointmentTime: '28 Jun, 01:00 PM',
      address: 'Solapur, Maharashtra - 413001',
      imageUrl: 'https://images.unsplash.com/photo-1551601651-2a8555f1a136',
    ),
    UpcomingAppointment(
      doctorName: 'Dr. Karan Shah',
      specialization: 'Psychiatrist',
      appointmentTime: '29 Jun, 11:15 AM',
      address: 'Sangli, Maharashtra - 416416',
      imageUrl: 'https://images.unsplash.com/photo-1537368910025-700350fe46c7',
    ),
    UpcomingAppointment(
      doctorName: 'Dr. Anjali Rao',
      specialization: 'General Physician',
      appointmentTime: '30 Jun, 03:45 PM',
      address: 'Satara, Maharashtra - 415001',
      imageUrl: 'https://images.unsplash.com/photo-1584515933487-779824d29309',
    ),
  ];
}