class User {
  int id;
  String email;
  String password;
  bool enabled;
  bool isAdmin;

  User({ required this.id,
    required this.email,
    required this.password,
    required this.enabled,
    required this.isAdmin,
  });

  factory User.fromJson(Map json) {
    return User(
      id: json["id"],
      email: json["email"],
      password: json["password"],
      enabled: json["enabled"],
      isAdmin: json["isAdmin"],
    );
  }
}