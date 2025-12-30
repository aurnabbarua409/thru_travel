// ignore_for_file: public_member_api_docs, sort_constructors_first
class FriendModel {
  final String id;
  final String image;
  final String name;

  bool isPlanAdd;
  FriendModel({
    required this.image,
    required this.name,
    this.isPlanAdd = false,
    required this.id,
  });
  factory FriendModel.fromJson(Map<String, dynamic> json) => FriendModel(
    id: json['_id'] ?? "",
    image: json['profile'] ?? "",
    name: json['name'] ?? "",
  );
}
