// first created the users json model

class Users {
  final int? userId;
  final String username;
  final String userpassword;

  Users({
    this.userId,
    required this.username,
    required this.userpassword,
  });

  factory Users.fromMap(Map<String, dynamic> json) => Users(
    userId: json["userId"],
    username: json["username"],
    userpassword: json["userpassword"],
  );

  Map<String, dynamic> toMap() => {
    "userId": userId,
    "username": username,
    "userpassword": userpassword,
  };
}
