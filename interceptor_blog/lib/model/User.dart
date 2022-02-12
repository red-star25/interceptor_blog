class User {
  final String id;
  final String name;
  final String email;

  User({
    required this.id,
    required this.name,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'] ?? "",
      name: json['name'] ?? json["username"] ?? "",
      email: json['email'] ?? "",
    );
  }
}
