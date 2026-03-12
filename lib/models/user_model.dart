class UserModel {
  final String id;
  final String email;
  final String? name;
  final String? phone;
  final String? avatar;
  final String? city;
  final DateTime createdAt;

  UserModel({
    required this.id,
    required this.email,
    this.name,
    this.phone,
    this.avatar,
    this.city,
    required this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      phone: json['phone'],
      avatar: json['avatar'],
      city: json['city'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'phone': phone,
      'avatar': avatar,
      'city': city,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
