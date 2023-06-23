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