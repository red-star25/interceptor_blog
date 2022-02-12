import 'package:dio/dio.dart';
import 'package:interceptor_blog/data/endpoints/endpoints.dart';
import 'package:interceptor_blog/data/network/dio_client.dart';
import 'package:interceptor_blog/data/sharedprefs/shared_preference_helper.dart';
import 'package:interceptor_blog/services/locator.dart';

class EmailRepository {
  final netWorkLocator = getIt.get<DioClient>();
  final sharedPrefLocator = getIt.get<SharedPreferenceHelper>();

  Future<String> getEmail({required String id}) async {
    final response = await netWorkLocator.dio.get(
      "${EndPoints.baseUrl}${EndPoints.userEmail}",
      options: Options(
        headers: {
          "Authorization": "${sharedPrefLocator.getUserToken()}",
        },
      ),
      queryParameters: {
        "_id": id,
      },
    );
    return response.data["email"];
  }
}
