class AdModel {
  final String id;
  final String userId;
  final String title;
  final String description;
  final double price;
  final String category;
  final String city;
  final List<String> images;
  final DateTime createdAt;
  final bool isActive;
  final Map<String, dynamic>? user;

  AdModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.city,
    required this.images,
    required this.createdAt,
    this.isActive = true,
    this.user,
  });

  factory AdModel.fromJson(Map<String, dynamic> json) {
    return AdModel(
      id: json['id'],
      userId: json['user_id'],
      title: json['title'],
      description: json['description'],
      price: (json['price'] as num).toDouble(),
      category: json['category'],
      city: json['city'],
      images: List<String>.from(json['images'] ?? []),
      createdAt: DateTime.parse(json['created_at']),
      isActive: json['is_active'] ?? true,
      user: json['profiles'],
    );
  }
}
