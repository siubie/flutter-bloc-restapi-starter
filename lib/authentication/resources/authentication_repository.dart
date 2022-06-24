import 'package:mystarter/constant/api_constants.dart';
import 'package:mystarter/rest/api_helpers/api_base_helpers.dart';
import 'package:mystarter/constant/api_constants.dart' as appConstant;

class AuthenticationService {
  Future<dynamic> signUpWithEmailAndPassword(
      String email, String password) async {}

  Future<dynamic> loginWithEmailAndPassword(
      String email, String password) async {
    final response = await ApiBaseHelper().post(
        appConstant.BASE_URL + '/auth/login',
        {"email": email, "password": password, "device_name": "android"});
    return response;
  }

  Future<dynamic> getUserData(int id) async {
    // final response = await ApiSdk.getUserData(id);

    // return response;
  }
}
