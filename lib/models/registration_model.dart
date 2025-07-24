class MemberModel {
  final String id;
  final String name;
  final String zone;
  final String zoneId;
  final String position;

  MemberModel({
    required this.id,
    required this.name,
    required this.zone,
    required this.zoneId,
    required this.position,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'zone': zone,
      zoneId: 'zoneId',
      'position': position,
    };
  }

  factory MemberModel.fromMap(Map<String, dynamic> map) {
    return MemberModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      zone: map['zone'] ?? '',
      zoneId: map['zoneId'] ?? '',
      position: map['position'] ?? '',
    );
  }
}
