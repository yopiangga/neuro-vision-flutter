class Notification {
  Map<String, dynamic> notification;
  Map<String, dynamic> user;

  Notification({
    required this.notification,
    required this.user,
  });

  factory Notification.fromJson(Map<String, dynamic> json) {
    return Notification(
      notification: json['notification'],
      user: json['user'],
    );
  }

  Map<String, dynamic> toJson() => {
        "notification": notification,
        "user": user,
      };
}
