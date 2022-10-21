import 'package:randomize_app/signInModel.dart';

class SignInModelValidator {
  String? username(SignInModel model) {
    if (!(model.username != null)) {
      return 'Ne smije biti prazno';
    }
    return null;
  }

  String? password(SignInModel model) {
    if (!(model.password != null)) {
      return 'Ne smije biti prazno';
    }
    return null;
  }

  bool validate(SignInModel model) {
    return ![
      username(model),
      password(model),
    ].any((x) => x != null);
  }
}
