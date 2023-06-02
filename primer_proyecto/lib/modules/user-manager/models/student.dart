class Student {
  String id;
  String name;
  String lastName;
  String dni;
  String phone;
  String section;
  String grade;
  String school;
  String email;
  String password;
  String urlToImageBackground;
  String urlToImageProfile;

  Student(
      { required this.id,
        required this.name,
        required this.lastName,
        required this.dni,
        required this.phone,
        required this.section,
        required this.grade,
        required this.school,
        required this.email,
        required this.password,
        required this.urlToImageBackground,
        required this.urlToImageProfile,

      });

  factory Student.fromJson(Map json) {
    return Student(
        id: json["id"],
        name: json["name"],
        lastName: json["lastName"],
        dni: json["dni"],
        phone: json["phone"],
        section: json["section"],
        grade: json["grade"],
        school: json["school"],
        email: json["email"],
        password:json["password"],
        urlToImageBackground:json["urlToImageBackground"],
        urlToImageProfile:json["urlToImageProfile"],
    );
  }
}

class Administrator {
  String id;
  String name;
  String lastName;
  String dni;
  String phone;
  String school;
  String email;
  String password;
  String urlToImageBackground;
  String urlToImageProfile;

  Administrator(
      { required this.id,
        required this.name,
        required this.lastName,
        required this.dni,
        required this.phone,
        required this.school,
        required this.email,
        required this.password,
        required this.urlToImageBackground,
        required this.urlToImageProfile,

      });

  factory Administrator.fromJson(Map json) {
    return Administrator(
      id: json["id"],
      name: json["name"],
      lastName: json["lastName"],
      dni: json["dni"],
      phone: json["phone"],
      school: json["school"],
      email: json["email"],
      password:json["password"],
      urlToImageBackground:json["urlToImageBackground"],
      urlToImageProfile:json["urlToImageProfile"],
    );
  }
}

