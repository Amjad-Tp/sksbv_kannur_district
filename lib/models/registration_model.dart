class MemberModel {
  final String id;
  final String name;
  final String zone;
  final String position;

  MemberModel({
    required this.id,
    required this.name,
    required this.zone,
    required this.position,
  });

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'zone': zone, 'position': position};
  }

  factory MemberModel.fromMap(Map<String, dynamic> map) {
    return MemberModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      zone: map['zone'] ?? '',
      position: map['position'] ?? '',
    );
  }
}
