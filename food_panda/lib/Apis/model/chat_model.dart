class ChatUsers {
  ChatUsers({
    required this.image,
    required this.name,
    required this.about,
    required this.lastActive,
    required this.id,
    required this.isOnline,
    required this.pushToken,
    required this.email,
  });
  late final String? image;
  late final String? name;
  late final String? about;
  late final String? lastActive;
  late final String? id;
  late final bool isOnline;
  late final String? pushToken;
  late final String? email;

  ChatUsers.fromJson(Map<String, dynamic> json) {
    image = json['image'] ?? " ";
    name = json['name'] ?? " ";
    about = json['about'] ?? " ";
    lastActive = json['last_active'] ?? " ";
    id = json['id'] ?? " ";
    isOnline = json['is_online'] ?? " ";
    pushToken = json['pushToken'] ?? " ";
    email = json['email'] ?? " ";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['name'] = name;
    data['about'] = about;
    data['last_active'] = lastActive;
    data['id'] = id;
    data['is_online'] = isOnline;
    data['pushToken'] = pushToken;
    data['email'] = email;
    return data;
  }

  fromJson(Map<String, dynamic> data) {}
}
