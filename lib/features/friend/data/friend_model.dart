// ignore_for_file: public_member_api_docs, sort_constructors_first
class FriendModel {
  final String image;
  final String name;
  final String status;
  FriendModel({required this.image, required this.name, required this.status});
  factory FriendModel.fromJson(Map<String, dynamic> json) => FriendModel(
    image: json['requestedBy']['profile'] ?? "",
    name: json['requestedBy']['name'] ?? "",
    status: json['status'] ?? "",
  );
}
