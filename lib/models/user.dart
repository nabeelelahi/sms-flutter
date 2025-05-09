class User {
  final String name;
  final String role;
  final String id;
  final String location;
  final String image;

  User({
    required this.name,
    required this.role,
    required this.id,
    required this.location,
    required this.image,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      role: json['role'],
      id: json['id'],
      location: json['location'],
      image: json['image'],
    );
  }
}
