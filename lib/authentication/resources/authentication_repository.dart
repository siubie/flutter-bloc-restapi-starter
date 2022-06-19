import 'package:mystarter/rest/api_helpers/api_base_helpers.dart';

class AuthenticationRepository {
  Future<dynamic> signUpWithEmailAndPassword(
      String email, String password) async {}

  Future<dynamic> loginWithEmailAndPassword(
      String email, String password) async {
    // final response = await ApiSdk.loginWithEmailAndPassword(
    //     {'email': email, 'password': password});

    // return response;
  }

  Future<dynamic> getUserData(int id) async {
    // final response = await ApiSdk.getUserData(id);

    // return response;
  }

  Future<dynamic> getActivity() async {
    final response =
        await ApiBaseHelper().get("http://www.boredapi.com/api/activity/");
    return response;
  }
}
