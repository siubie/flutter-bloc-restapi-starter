import 'package:mystarter/rest/api_helpers/api_base_helpers.dart';

class BoredService {
  Future<dynamic> getActivity() async {
    final response =
        await ApiBaseHelper().get("http://www.boredapi.com/api/activity/");
    return response;
  }
}
