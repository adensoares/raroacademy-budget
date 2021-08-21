import 'dart:convert';

class UserModel {
  String? userId;
  String? name;
  String? email;
  String? phone;
  String? cpf;
  String? password;

  UserModel({
    required this.userId,
    required this.name,
    required this.email,
    required this.phone,
    required this.cpf,
    required this.password,
  });

  UserModel copyWith({
    String? userId,
    String? name,
    String? email,
    String? phone,
    String? cpf,
    String? password,
  }) {
    return UserModel(
      userId: userId ?? this.userId,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      cpf: cpf ?? this.cpf,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'name': name,
      'email': email,
      'phone': phone,
      'cpf': cpf,
      'password': password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['uid'],
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
      cpf: map['cpf'],
      password: map['senha'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(userId: $userId, name: $name, email: $email, phone: $phone, cpf: $cpf, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.userId == userId &&
        other.name == name &&
        other.email == email &&
        other.phone == phone &&
        other.cpf == cpf &&
        other.password == password;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
        name.hashCode ^
        email.hashCode ^
        phone.hashCode ^
        cpf.hashCode ^
        password.hashCode;
  }
}
