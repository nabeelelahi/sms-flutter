class User {
  User({
    required this.id,
    required this.name,
    required this.age,
    required this.residence,
    required this.email,
    required this.emailVerifiedAt,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String name;
  final String email;
  final int age;
  final String residence;
  final DateTime? emailVerifiedAt;
  final String role;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      age: json["age"],
      residence: json["residence"],
      emailVerifiedAt: DateTime.tryParse(json["email_verified_at"] ?? ""),
      role: json["role"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }
}
