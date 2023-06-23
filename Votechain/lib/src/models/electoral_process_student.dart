class ProcessStudent {
  int id;
  int electoralProcessId;
  int studentId;

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