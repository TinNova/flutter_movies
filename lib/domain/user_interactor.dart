import '../app/locator.dart';
import '../data/models/login_tokens.dart';
import '../data/network/json_repo.dart';

class UserInteractor {
  final _jsonRepo = locator<JsonRepo>();

  Future<LoginTokens> getUser(String username, String password) async {
    Map<String, String> body = {
      "username": username,
      "password": password,
    };
    return _jsonRepo.loginWithBody(body);
  }
}
