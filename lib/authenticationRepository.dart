import 'package:randomize_app/signInModel.dart';

abstract class IAuthenticationRepository {
  Future<bool> signIn(SignInModel model);
}

class AuthenticationRepository implements IAuthenticationRepository {
  @override
  Future<bool> signIn(SignInModel model) async {
    SignInModel trueSignIn =
        SignInModel(username: 'Ivan', password: 'Ivan1234');

    try {
      final result = ((trueSignIn.username== model.username) && (trueSignIn.password== model.password));
      if (!result) {
        return false;
      }
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
