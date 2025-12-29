import 'package:new_untitled/features/profile/data/profile_model.dart';

class PlanModel {
  final String id;
  final LocationModel location;
  final String title;
  final String description;
  final List<String> images;
  final DateTime date;
  final DateTime endDate;
  final String address;
  final String link;
  final List<dynamic> friends;
  final int commentCount;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  PlanModel({
    required this.id,
    required this.location,
    required this.title,
    required this.description,
    required this.images,
    required this.date,
    required this.address,
    required this.link,
    required this.friends,
    required this.commentCount,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.endDate,
  });

  factory PlanModel.fromJson(Map<String, dynamic> json) {
    return PlanModel(
      id: json['_id'] ?? '',
      location:
          json['location'] != null
              ? LocationModel.fromJson(json['location'])
              : LocationModel.empty(),
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      images: List<String>.from(json['images'] ?? []),
      date:
          DateTime.tryParse(json['date'] ?? '') ??
          DateTime.fromMillisecondsSinceEpoch(0),
      endDate:
          DateTime.tryParse(json['endDate'] ?? '') ??
          DateTime.fromMillisecondsSinceEpoch(0),
      address: json['address'] ?? '',
      link: json['link'] ?? '',
      friends: json['friends'] ?? [],
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
      'title': title,
      'description': description,
      'images': images,
      'date': date.toIso8601String(),
      'address': address,
      'link': link,
      'friends': friends,
      'commentCount': commentCount,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': v,
    };
  }
}
