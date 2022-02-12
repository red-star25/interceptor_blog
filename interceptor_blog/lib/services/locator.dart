import 'package:get_it/get_it.dart';
import 'package:interceptor_blog/data/network/dio_client.dart';
import 'package:interceptor_blog/data/sharedprefs/shared_preference_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  final _prefs = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferenceHelper>(
    SharedPreferenceHelper(prefs: _prefs),
  );
  getIt.registerSingleton<DioClient>(DioClient());
}
