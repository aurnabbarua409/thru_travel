class ProfileModel {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String status;
  final bool verified;
  final String role;
  final String bio;
  final LocationModel location;
  final DateTime createdAt;

  ProfileModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.status,
    required this.verified,
    required this.role,
    required this.location,
    required this.createdAt,
    required this.bio,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      status: json['status'] ?? '',
      bio: json['bio'] ?? '',
      verified: json['verified'] ?? false,
      role: json['role'] ?? '',
      location: LocationModel.fromJson(json['location'] ?? {}),
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'status': status,
      'verified': verified,
      'role': role,
      'location': location.toJson(),
      'createdAt': createdAt.toIso8601String(),
    };
  }
}

class LocationModel {
  final String type;
  final List<double> coordinates;

  LocationModel({required this.type, required this.coordinates});

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      type: json['type'] ?? '',
      coordinates:
          json['coordinates'] != null
              ? List<double>.from(
                json['coordinates'].map((e) => (e as num).toDouble()),
              )
              : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {'type': type, 'coordinates': coordinates};
  }
}
