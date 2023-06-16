import 'dart:ffi';

class Classroom {
  Int id;
  String name;
  String section;
  Int grade;
  Int schoolId;

  Classroom(
      { required this.id,
        required this.name,
        required this.section,
        required this.grade,
        required this.schoolId,
      });

  factory Classroom.fromJson(Map json) {
    return Classroom(
      id: json["id"],
      name: json["name"],
      section: json["section"],
      grade: json["grade"],
      schoolId: json["schoolId"],
    );
  }
}

class School {
  Int id;
  String name;

  School({ required this.id,
    required this.name,
  });

  factory School.fromJson(Map json) {
    return School(
      id: json["id"],
      name: json["name"],
    );
  }
}

class Rol {
  Int id;
  String name;

  Rol({ required this.id,
    required this.name,
  });

  factory Rol.fromJson(Map json) {
    return Rol(
      id: json["id"],
      name: json["name"],
    );
  }
}

class PoliticalPartyParticipants {
  int id;
  int electoralProcessId;
  int masterPoliticalPartyId;
  //String assigned_at;

  PoliticalPartyParticipants(
      { required this.id,
        required this.electoralProcessId,
        required this.masterPoliticalPartyId,
      });

  factory PoliticalPartyParticipants.fromJson(Map json) {
    return PoliticalPartyParticipants(
      id: json["id"],
      electoralProcessId: json["electoralProcessId"],
      masterPoliticalPartyId: json["masterPoliticalPartyId"],
    );
  }
}

class MasterPoliticalParty {
  int id;
  String name;
  String description;
  String proposes;
  int schoolId;

  MasterPoliticalParty(
      this.id,
     this.name,
     this.description,
     this.proposes,
     this.schoolId,
  );

 /* factory MasterPoliticalParty.fromJson(Map json) {
    return MasterPoliticalParty(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      proposes: json["proposes"],
      schoolId: json["schoolId"],
    );
  }*/
}


class User {
  Int id;
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

class Notifications {
  Int id;
  String title;
  String description;
  Int status;
  Int userId;
  Int electoralProcessId;

  Notifications({ required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.userId,
    required this.electoralProcessId,
  });

  factory Notifications.fromJson(Map json) {
    return Notifications(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      status: json["status"],
      userId: json["userId"],
      electoralProcessId: json["electoralProcessId"],
    );
  }
}

class Vote {
  //Int id;
 // String blockchain_code;
  int studentId;
  int politicalPartyId;

  Vote(//required this.id,
    //required this.blockchain_code,
     this.studentId,
     this.politicalPartyId,
  );

  /*factory Vote.fromJson(Map json) {
    return Vote(
      //id: json["id"],
      //blockchain_code: json["blockchain_code"],
      studentId: json["studentId"],
      politicalPartyId: json["politicalPartyId"],
    );
  }*/
}

class ProcessAdministrator {
  Int id;
  Int electoralProcessId;
  Int administratorId;

  ProcessAdministrator({ required this.id,
    required this.electoralProcessId,
    required this.administratorId,
  });
  factory ProcessAdministrator.fromJson(Map json) {
    return ProcessAdministrator(
      id: json["id"],
      electoralProcessId: json["electoralProcessId"],
      administratorId: json["administratorId"],
    );
  }
}

class ProcessStudent {
  Int id;
  Int electoralProcessId;
  Int studentId;

  ProcessStudent({ required this.id,
    required this.electoralProcessId,
    required this.studentId,
  });
  factory ProcessStudent.fromJson(Map json) {
    return ProcessStudent(
      id: json["id"],
      electoralProcessId: json["electoralProcessId"],
      studentId: json["studentId"],
    );
  }
}

class ElectoralProcess {
  Int id;
  String title;
  Int status;
  Int schoolId;

  ElectoralProcess({ required this.id,
    required this.title,
    required this.status,
    required this.schoolId,
  });
  factory ElectoralProcess.fromJson(Map json) {
    return ElectoralProcess(
      id: json["id"],
      title: json["title"],
      status: json["status"],
      schoolId: json["schoolId"],
    );
  }
}

class Student {
  String id;
  String name;
  String lastName;
  String identifier;
  String dni;
  Int classroomId;
  Int userId;
  Int rolId;
  Int politicalPartyParticipantId;

  Student(
      { required this.id,
        required this.name,
        required this.lastName,
        required this.identifier,
        required this.dni,
        required this.classroomId,
        required this.userId,
        required this.rolId,
        required this.politicalPartyParticipantId,
      });

  factory Student.fromJson(Map json) {
    return Student(
      id: json["id"],
      name: json["name"],
      lastName: json["lastName"],
      identifier: json["identifier"],
      dni: json["dni"],
      classroomId: json["classroomId"],
      userId: json["userId"],
      rolId: json["rolId"],
      politicalPartyParticipantId: json["politicalPartyParticipantId"],
    );
  }
}

class Administrator {
  String id;
  String name;
  String lastName;
  String identifier;
  Int userId;
  Int rolId;
  Int politicalPartyParticipantId;

  Administrator(
      { required this.id,
        required this.name,
        required this.lastName,
        required this.identifier,
        required this.userId,
        required this.rolId,
        required this.politicalPartyParticipantId,
      });

  factory Administrator.fromJson(Map json) {
    return Administrator(
      id: json["id"],
      name: json["name"],
      lastName: json["lastName"],
      identifier: json["identifier"],
      userId: json["userId"],
      rolId: json["rolId"],
      politicalPartyParticipantId: json["politicalPartyParticipantId"],
    );
  }
}













