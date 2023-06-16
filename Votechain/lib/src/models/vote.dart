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