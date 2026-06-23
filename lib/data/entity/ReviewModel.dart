class ReviewModel {
  final String name;
  final String photo;
  final double rating;
  final String comment;
  final String timeAgo;

  ReviewModel({
    required this.name,
    required this.photo,
    required this.rating,
    required this.comment,
    required this.timeAgo,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      name: json['name'] ?? '',
      photo: json['photo'] ?? '',
      rating: (json['rating'] ?? 0).toDouble(),
      comment: json['comment'] ?? '',
      timeAgo: json['timeAgo'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'photo': photo,
      'rating': rating,
      'comment': comment,
      'timeAgo': timeAgo,
    };
  }

  static List<ReviewModel> reviews = [
    ReviewModel(
      name: 'Aarav Sharma',
      photo: 'https://i.pravatar.cc/150?img=1',
      rating: 5.0,
      comment:
      'Exceptional service with great attention to detail. The team was professional, responsive, and ensured a smooth experience from start to finish.',
      timeAgo: '2 hours ago',
    ),
    ReviewModel(
      name: 'Priya Patel',
      photo: 'https://i.pravatar.cc/150?img=2',
      rating: 4.8,
      comment:
      'Highly impressed with the quality of work and customer support. Every aspect was handled efficiently and exceeded expectations.',
      timeAgo: '5 hours ago',
    ),
    ReviewModel(
      name: 'Rahul Verma',
      photo: 'https://i.pravatar.cc/150?img=3',
      rating: 4.7,
      comment:
      'The staff demonstrated excellent professionalism throughout the process. Their expertise and commitment to customer satisfaction were evident.',
      timeAgo: '1 day ago',
    ),
    ReviewModel(
      name: 'Sneha Joshi',
      photo: 'https://i.pravatar.cc/150?img=4',
      rating: 5.0,
      comment:
      'Outstanding experience from beginning to end. The service was delivered promptly with a strong focus on quality and reliability.',
      timeAgo: '2 days ago',
    ),
    ReviewModel(
      name: 'Vikram Singh',
      photo: 'https://i.pravatar.cc/150?img=5',
      rating: 4.9,
      comment:
      'A well-organized and customer-focused team. They provided clear communication and delivered exactly as promised.',
      timeAgo: '3 days ago',
    ),
    ReviewModel(
      name: 'Ananya Desai',
      photo: 'https://i.pravatar.cc/150?img=6',
      rating: 4.8,
      comment:
      'The level of professionalism and attention to customer needs was remarkable. I would confidently recommend their services.',
      timeAgo: '4 days ago',
    ),
    ReviewModel(
      name: 'Karan Mehta',
      photo: 'https://i.pravatar.cc/150?img=7',
      rating: 4.6,
      comment:
      'Excellent service standards and a highly skilled team. The overall experience was seamless and well managed.',
      timeAgo: '5 days ago',
    ),
    ReviewModel(
      name: 'Meera Kapoor',
      photo: 'https://i.pravatar.cc/150?img=8',
      rating: 5.0,
      comment:
      'Very satisfied with the outcome and the professionalism shown throughout. The quality of service was truly exceptional.',
      timeAgo: '1 week ago',
    ),
    ReviewModel(
      name: 'Rohan Gupta',
      photo: 'https://i.pravatar.cc/150?img=9',
      rating: 4.7,
      comment:
      'A reliable and trustworthy service provider. Their dedication to delivering a positive customer experience stands out.',
      timeAgo: '1 week ago',
    ),
    ReviewModel(
      name: 'Isha Nair',
      photo: 'https://i.pravatar.cc/150?img=10',
      rating: 5.0,
      comment:
      'Exceptional quality, professional approach, and timely delivery. It was a pleasure working with such a dedicated team.',
      timeAgo: '2 weeks ago',
    ),
  ];
}