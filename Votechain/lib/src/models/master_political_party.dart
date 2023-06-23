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