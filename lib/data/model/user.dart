class User {
  final String username;
  final String password;
  final String userType; // 'free' or 'premium'

  User({
    required this.username,
    required this.password,
    required this.userType,
  });
}
