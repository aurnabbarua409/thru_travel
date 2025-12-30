// ignore_for_file: public_member_api_docs, sort_constructors_first
class FriendModel {
  final String id;
  final String image;
  final String name;
  final DateTime createdAt;
  bool isInPlan;
  bool isPlanRequestSent;

  FriendModel({
    required this.id,
    required this.image,
    required this.name,
    required this.createdAt,
    required this.isInPlan,
    required this.isPlanRequestSent,
  });
  factory FriendModel.fromJson(Map<String, dynamic> json) => FriendModel(
    id: json['_id'] ?? "",
    image: json['profile'] ?? "",
    name: json['name'] ?? "",
    isInPlan: json['isInPlan'] ?? false,
    createdAt:
        json['createdAt'] != null
            ? DateTime.parse(json['createdAt'])
            : DateTime.now(),
    isPlanRequestSent: json['isPlanRequestSent'] ?? false,
  );
}
