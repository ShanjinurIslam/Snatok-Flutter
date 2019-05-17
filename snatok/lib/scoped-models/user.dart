import 'package:scoped_model/scoped_model.dart';
import 'package:snatok/models/user.dart';

class UserModel extends Model {
  User
      _authenticatedUser; // _ variable indicates we should not access it from outside

  void login(String email, String password) {
    _authenticatedUser =
        new User(id: 'dummy', email: email, password: password);
  }
}
