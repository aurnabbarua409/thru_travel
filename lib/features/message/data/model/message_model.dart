class MessageModel {
  final String id;
  final String friend;
  final String message;
  final bool isRead;
  final UserModel sender;
  final UserModel receiver;
  final DateTime createdAt;
  final DateTime updatedAt;

  MessageModel({
    required this.id,
    required this.friend,
    required this.message,
    required this.isRead,
    required this.sender,
    required this.receiver,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['_id'] ?? '',
      friend: json['friend'] ?? '',
      message: json['message'] ?? '',
      isRead: json['isRead'] ?? false,
      sender: UserModel.fromJson(json['sender'] ?? {}),
      receiver: UserModel.fromJson(json['receiver'] ?? {}),
      createdAt:
          json['createdAt'] != null
              ? DateTime.parse(json['createdAt'])
              : DateTime.now(),
      updatedAt:
          json['updatedAt'] != null
              ? DateTime.parse(json['updatedAt'])
              : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'friend': friend,
      'message': message,
      'isRead': isRead,
      'sender': sender.toJson(),
      'receiver': receiver.toJson(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}

class UserModel {
  final String id;
  final String name;
  final String profile;

  UserModel({required this.id, required this.name, required this.profile});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      profile: json['profile'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'_id': id, 'name': name, 'profile': profile};
  }
}
