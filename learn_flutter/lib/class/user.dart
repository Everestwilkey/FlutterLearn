class User {
  final String email;
  final String firstName;
  final String lastName;

  User({required this.email, required this.firstName, required this.lastName});

  // Updated factory method with null checks
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'], // Assuming 'email' is always expected
      firstName: json['firstname'], // Use a default value if null
      lastName: json['lastname'], // Use a default value if null
    );
  }
}
