class AuthModel {
  String password;
  String? email;
  String? firstName;
  String? lastName;
  String? location;

  AuthModel({
    required this.password,
    this.email,
    this.firstName,
    this.lastName,
    this.location,
  });

  Map<String, dynamic> toMap() {
    return {
      'password': password,
      'email': email,
      'firstname': firstName,
      'lastname': lastName,
      'location': location,
    };
  }

  factory AuthModel.fromMap(Map<String, dynamic> map) {
    return AuthModel(
      password: map['password'] as String,
      email: map['email'] as String?,
      firstName: map['firstname'],
      lastName: map['lastname'],
      location: map['location'],
    );
  }
}
