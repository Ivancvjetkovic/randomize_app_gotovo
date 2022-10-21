// ignore_for_file: public_member_api_docs, sort_constructors_first
class SignInModel {
  String? password = '';
  String? username = '';
  SignInModel({
    this.username,
    this.password,
  });

  SignInModel copyWith({
    String? password,
    String? username,
  }) {
    return SignInModel(
      password: password ?? this.password,
      username: username ?? this.username,
    );
  }
}
