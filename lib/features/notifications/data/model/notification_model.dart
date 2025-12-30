// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:new_untitled/features/profile/data/profile_model.dart';

class NotificationModel {
  final String id;
  final UserModel to;
  final UserModel from;
  final String title;
  final String body;
  final bool isRead;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;
  bool isFollowing;

  NotificationModel({
    required this.id,
    required this.to,
    required this.from,
    required this.title,
    required this.body,
    required this.isRead,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    this.isFollowing = false,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['_id'] ?? '',
      to: UserModel.fromJson(json['to'] ?? {}),
      from: UserModel.fromJson(json['from'] ?? {}),
      title: json['title'] ?? '',
      body: json['body'] ?? '',
      isRead: json['isRead'] ?? false,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      v: json['__v'] ?? 0,
    );
  }
}

class UserModel {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String status;
  final bool verified;
  final String role;
  final String profile;
  final String bio;
  final String address;
  final String totalDays;
  final LocationModel location;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.status,
    required this.verified,
    required this.role,
    required this.profile,
    required this.bio,
    required this.address,
    required this.totalDays,
    required this.location,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      status: json['status'] ?? '',
      verified: json['verified'] ?? false,
      role: json['role'] ?? '',
      profile: json['profile'] ?? '',
      bio: json['bio'] ?? '',
      address: json['address'] ?? '',
      totalDays: json['totalDays'] ?? '',
      location:
          json['location'] != null
              ? LocationModel.fromJson(json['location'])
              : LocationModel.empty(),
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
}
