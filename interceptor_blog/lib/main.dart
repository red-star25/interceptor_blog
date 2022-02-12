import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interceptor_blog/bloc/auth/auth_bloc.dart';
import 'package:interceptor_blog/bloc/email/email_bloc.dart';
import 'package:interceptor_blog/bloc/home/home_bloc.dart';
import 'package:interceptor_blog/bloc/profile/profile_bloc.dart';
import 'package:interceptor_blog/data/repository/auth_repository.dart';
import 'package:interceptor_blog/data/repository/email_repository.dart';
import 'package:interceptor_blog/data/repository/home_repository.dart';
import 'package:interceptor_blog/data/repository/profile_repository.dart';
import 'package:interceptor_blog/data/sharedprefs/shared_preference_helper.dart';
import 'package:interceptor_blog/presenatation/auth/login/login_page.dart';
import 'package:interceptor_blog/presenatation/home/home_page.dart';
import 'package:interceptor_blog/services/locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final String? token;
  final locator = getIt.get<SharedPreferenceHelper>();

  @override
  void initState() {
    super.initState();
    token = locator.getUserToken();
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
          create: (context) => AuthRepository(),
        ),
        RepositoryProvider<HomeRepository>(
          create: (context) => HomeRepository(),
        ),
        RepositoryProvider<EmailRepository>(
          create: (context) => EmailRepository(),
        ),
        RepositoryProvider<ProfileRepository>(
          create: (context) => ProfileRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(
              authRepository: RepositoryProvider.of<AuthRepository>(context),
            ),
          ),
          BlocProvider<HomeBloc>(
            create: (context) => HomeBloc(
              homeRepository: RepositoryProvider.of<HomeRepository>(context),
            )..add(LoadUserEvent()),
          ),
          BlocProvider<EmailBloc>(
            create: (context) => EmailBloc(
              emailRepository: RepositoryProvider.of<EmailRepository>(context),
            ),
          ),
          BlocProvider<ProfileBloc>(
            create: (context) => ProfileBloc(
              profileRepository:
                  RepositoryProvider.of<ProfileRepository>(context),
            ),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: token != null ? const HomePage() : const LogInPage(),
        ),
      ),
    );
  }
}
