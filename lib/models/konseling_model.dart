class KonselingModel {
  final String id;
  final String name;
  final String image;
  final String availableTime;

  KonselingModel({
    required this.id,
    required this.name,
    required this.image,
    required this.availableTime,
  });

  factory KonselingModel.fromMap(Map<String, dynamic> map) {
    return KonselingModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      availableTime: map['availableTime'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'availableTime': availableTime,
    };
  }
}
