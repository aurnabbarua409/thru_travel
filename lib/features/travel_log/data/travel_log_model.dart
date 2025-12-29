class TravelLogModel {
  final String id;
  final LocationModel location;
  final String createdBy;
  final String title;
  final String description;
  final List<String> images;
  final DateTime date;
  final DateTime endDate;
  final String address;
  final String link;
  final List<dynamic> activities;
  final List<dynamic> friends;
  final int commentCount;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  TravelLogModel({
    required this.id,
    required this.location,
    required this.createdBy,
    required this.title,
    required this.description,
    required this.images,
    required this.date,
    required this.endDate,
    required this.address,
    required this.link,
    required this.activities,
    required this.friends,
    required this.commentCount,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory TravelLogModel.fromJson(Map<String, dynamic> json) {
    return TravelLogModel(
      id: json['_id'] ?? '',
      location:
          json['location'] != null
              ? LocationModel.fromJson(json['location'])
              : LocationModel.empty(),
      createdBy: json['createdBy'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      images: List<String>.from(json['images'] ?? []),
      date: DateTime.parse(json['date']),
      endDate: DateTime.parse(json['endDate']),
      address: json['address'] ?? '',
      link: json['link'] ?? '',
      activities: json['activities'] ?? [],
      friends: json['friends'] ?? [],
      commentCount: json['commentCount'] ?? 0,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      v: json['__v'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'location': location.toJson(),
      'createdBy': createdBy,
      'title': title,
      'description': description,
      'images': images,
      'date': date.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'address': address,
      'link': link,
      'activities': activities,
      'friends': friends,
      'commentCount': commentCount,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': v,
    };
  }
}

class LocationModel {
  final String type;
  final List<double> coordinates;

  LocationModel({required this.type, required this.coordinates});

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      type: json['type'] ?? 'Point',
      coordinates:
          (json['coordinates'] as List?)
              ?.map((e) => (e as num).toDouble())
              .toList() ??
          [0.0, 0.0],
    );
  }

  factory LocationModel.empty() {
    return LocationModel(type: 'Point', coordinates: [0.0, 0.0]);
  }

  double get longitude => coordinates.isNotEmpty ? coordinates[0] : 0.0;
  double get latitude => coordinates.length > 1 ? coordinates[1] : 0.0;

  Map<String, dynamic> toJson() {
    return {'type': type, 'coordinates': coordinates};
  }
}
