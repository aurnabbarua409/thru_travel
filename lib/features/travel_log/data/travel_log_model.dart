class TravelLogModel {
  final String id;
  final String createdBy;
  final String title;
  final String description;
  final List<String> images;
  final DateTime date;
  final DateTime endDate;
  final String address;
  final String link;
  final int commentCount;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  TravelLogModel({
    required this.id,
    required this.createdBy,
    required this.title,
    required this.description,
    required this.images,
    required this.date,
    required this.endDate,
    required this.address,
    required this.link,
    required this.commentCount,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory TravelLogModel.fromJson(Map<String, dynamic> json) {
    return TravelLogModel(
      id: json['_id'] ?? '',
      createdBy: json['createdBy'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      images:
          json['images'] != null
              ? (json['images'] as List).map((e) => e.toString()).toList()
              : [],
      date:
          json['date'] != null ? DateTime.parse(json['date']) : DateTime.now(),
      endDate:
          json['endDate'] != null
              ? DateTime.parse(json['endDate'])
              : DateTime.now(),
      address: json['address'] ?? '',
      link: json['link'] ?? '',
      commentCount: json['commentCount'] ?? 0,
      createdAt:
          json['createdAt'] != null
              ? DateTime.parse(json['createdAt'])
              : DateTime.now(),
      updatedAt:
          json['updatedAt'] != null
              ? DateTime.parse(json['updatedAt'])
              : DateTime.now(),
      v: json['__v'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'createdBy': createdBy,
      'title': title,
      'description': description,
      'images': images,
      'date': date.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'address': address,
      'link': link,
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
