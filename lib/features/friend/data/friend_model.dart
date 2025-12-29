// ignore_for_file: public_member_api_docs, sort_constructors_first
class FriendModel {
  final String image;
  final String name;
  FriendModel({required this.image, required this.name});
  factory FriendModel.fromJson(Map<String, dynamic> json) =>
      FriendModel(image: json['image'] ?? "", name: json['name'] ?? "");
}
