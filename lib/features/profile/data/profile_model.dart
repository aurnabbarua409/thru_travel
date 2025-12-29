// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProfileModel {
  final String id;
  String name;
  final String email;
  String phone;
  final String status;
  final bool verified;
  final String role;
  String bio;
  String address;
  String totalDays;
  LocationModel location;
  final DateTime createdAt;

  ProfileModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.status,
    required this.verified,
    required this.role,
    required this.bio,
    required this.address,
    required this.totalDays,
    required this.location,
    required this.createdAt,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      status: json['status'] ?? '',
      bio: json['bio'] ?? '',
      totalDays: json['totalDays'] ?? "",
      address: json['address'] ?? "",
      verified: json['verified'] ?? false,
      role: json['role'] ?? '',
      location:
          json['location'] != null
              ? LocationModel.fromJson(json['location'] ?? {})
              : LocationModel.empty(),
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
  List<double> coordinates;

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

  factory LocationModel.empty() {
    return LocationModel(type: 'Point', coordinates: [0.0, 0.0]);
  }

  Map<String, dynamic> toJson() {
    return {'type': type, 'coordinates': coordinates};
  }
}
