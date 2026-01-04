class HappeningModel {
  final String id;
  final LocationModel location;
  final CreatedByModel createdBy;
  final String title;
  final String description;
  final List<String> images;
  final DateTime date;
  final DateTime endDate;
  final String address;
  final String link;
  final List<ActivityModel> activities;
  int commentCount;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  HappeningModel({
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
    required this.commentCount,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory HappeningModel.fromJson(Map<String, dynamic> json) {
    return HappeningModel(
      id: json['_id'] ?? '',
      location:
          json['location'] != null
              ? LocationModel.fromJson(json['location'])
              : LocationModel.empty(),
      createdBy:
          json['createdBy'] != null
              ? CreatedByModel.fromJson(json['createdBy'])
              : CreatedByModel.empty(),
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      images:
          json['images'] != null
              ? (json['images'] as List).map((e) => e.toString()).toList()
              : [],
      date:
          DateTime.tryParse(json['date'] ?? '') ??
          DateTime.fromMillisecondsSinceEpoch(0),
      endDate:
          DateTime.tryParse(json['endDate'] ?? '') ??
          DateTime.fromMillisecondsSinceEpoch(0),
      address: json['address'] ?? '',
      link: json['link'] ?? '',
      activities:
          json['activities'] != null
              ? (json['activities'] as List)
                  .map((e) => ActivityModel.fromJson(e))
                  .toList()
              : [],
      commentCount: json['commentCount'] ?? 0,
      createdAt:
          DateTime.tryParse(json['createdAt'] ?? '') ??
          DateTime.fromMillisecondsSinceEpoch(0),
      updatedAt:
          DateTime.tryParse(json['updatedAt'] ?? '') ??
          DateTime.fromMillisecondsSinceEpoch(0),
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

class CreatedByModel {
  final String id;
  final String name;
  final String profile;

  CreatedByModel({required this.id, required this.name, required this.profile});

  factory CreatedByModel.fromJson(Map<String, dynamic> json) {
    return CreatedByModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      profile: json['profile'] ?? '',
    );
  }

  factory CreatedByModel.empty() {
    return CreatedByModel(id: '', name: '', profile: '');
  }

  Map<String, dynamic> toJson() {
    return {'_id': id, 'name': name, 'profile': profile};
  }
}

class ActivityModel {
  final String id;
  final String title;
  final String externalId;
  final String description;
  final String address;
  final DateTime date;
  final List<String> images;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  ActivityModel({
    required this.id,
    required this.title,
    required this.externalId,
    required this.description,
    required this.address,
    required this.date,
    required this.images,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory ActivityModel.fromJson(Map<String, dynamic> json) {
    return ActivityModel(
      id: json['_id'] ?? '',
      title: json['title'] ?? '',
      externalId: json['externalId'] ?? '',
      description: json['description'] ?? '',
      address: json['address'] ?? '',
      date:
          json['date'] != null ? DateTime.parse(json['date']) : DateTime.now(),
      images:
          (json['images'] as List?)?.map((e) => e.toString()).toList() ?? [],
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
      'title': title,
      'externalId': externalId,
      'description': description,
      'address': address,
      'date': date.toIso8601String(),
      'images': images,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': v,
    };
  }
}
