class DoctorModel {
  final String doctorName;
  final String specialization;
  final String appointmentTime;
  final String address;
  final double rating;
  final String imageUrl;
  final String exp;

  const DoctorModel({
    required this.doctorName,
    required this.specialization,
    required this.appointmentTime,
    required this.address,
    required this.imageUrl,
    required this.rating, required this.exp,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      doctorName: json['doctorName'] ?? '',
      specialization: json['specialization'] ?? '',
      appointmentTime: json['appointmentTime'] ?? '',
      address: json['address'] ?? '',
      rating: json['rating'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      exp: json['exp']??''
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'doctorName': doctorName,
      'specialization': specialization,
      'appointmentTime': appointmentTime,
      'address': address,
      'rating':rating,
      'imageUrl': imageUrl,
      'exp':exp
    };
  }

  static List<DoctorModel> appointments = [
    DoctorModel(
      doctorName: 'Dr. Arjun Mehta',
      specialization: 'Cardiologist',
      appointmentTime: '10:20 AM - 2:30 PM',
      address: 'Pune, Maharashtra - 411046',
      rating: 4.8,
      exp: "10",
      imageUrl: 'https://static.vecteezy.com/system/resources/thumbnails/026/375/249/small/ai-generative-portrait-of-confident-male-doctor-in-white-coat-and-stethoscope-standing-with-arms-crossed-and-looking-at-camera-photo.jpg',
    ),
    DoctorModel(
      doctorName: 'Dr. Priya Sharma',
      specialization: 'Dermatologist',
      appointmentTime: '11:00 AM - 5:30 PM',
      address: 'Mumbai, Maharashtra - 400001',
      rating: 3.6,exp: "3",
      imageUrl: 'https://images.unsplash.com/photo-1559839734-2b71ea197ec2',
    ),
    DoctorModel(
      doctorName: 'Dr. Rajesh Verma',
      specialization: 'Neurologist',
      appointmentTime: '1:00 AM - 5:30 PM',
      address: 'Nagpur, Maharashtra - 440001',
      rating: 4.0,
      exp: "8",
      imageUrl: 'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d',
    ),
    DoctorModel(
      doctorName: 'Dr. Sneha Patil',
      specialization: 'Pediatrician',
      appointmentTime: '4:20 AM - 6:30 PM',
      address: 'Kolhapur, Maharashtra - 416003',
      rating: 4.5,
      exp: "10",
      imageUrl: 'https://images.unsplash.com/photo-1594824476967-48c8b964273f',
    ),
    DoctorModel(
      doctorName: 'Dr. Amit Kulkarni',
      specialization: 'Orthopedic Surgeon',
      appointmentTime: '10:20 AM - 6:30 PM',
      address: 'Nashik, Maharashtra - 422001',
      rating: 4.3,
      exp: "8",
      imageUrl: 'https://images.unsplash.com/photo-1622253692010-333f2da6031d',
    ),
    DoctorModel(
      doctorName: 'Dr. Neha Joshi',
      specialization: 'Gynecologist',
      appointmentTime: '10:20 AM - 2:30 PM',
      address: 'Thane, Maharashtra - 400601',
      rating: 4.1,
      exp: "9",
      imageUrl: 'https://images.unsplash.com/photo-1651008376811-b90baee60c1f',
    ),
    DoctorModel(
      doctorName: 'Dr. Vikram Singh',
      specialization: 'ENT Specialist',
      appointmentTime: '10:20 AM - 4:30 PM',
      address: 'Aurangabad, Maharashtra - 431001',
      rating: 3.7,
      exp: "5",
      imageUrl: 'https://images.unsplash.com/photo-1582750433449-648ed127bb54',
    ),
    DoctorModel(
      doctorName: 'Dr. Pooja Deshmukh',
      specialization: 'Ophthalmologist',
      appointmentTime: '10:20 AM - 5:30 PM',
      address: 'Solapur, Maharashtra - 413001',
      rating: 4.2,
      exp: "9",
      imageUrl: 'https://images.unsplash.com/photo-1551601651-2a8555f1a136',
    ),
    DoctorModel(
      doctorName: 'Dr. Karan Shah',
      specialization: 'Psychiatrist',
      appointmentTime: '10:20 AM - 6:30 PM',
      address: 'Sangli, Maharashtra - 416416',
      rating: 3.0,
      exp: "7.5",
      imageUrl: 'https://images.unsplash.com/photo-1537368910025-700350fe46c7',
    ),
    DoctorModel(
      doctorName: 'Dr. Anjali Rao',
      specialization: 'General Physician',
      appointmentTime: '10:20 AM - 7:30 PM',
      address: 'Satara, Maharashtra - 415001',
      rating: 3.8,
      exp: "14",
      imageUrl: 'https://images.unsplash.com/photo-1584515933487-779824d29309',
    ),
  ];
}