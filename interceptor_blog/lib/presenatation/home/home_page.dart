import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interceptor_blog/bloc/auth/auth_bloc.dart';
import 'package:interceptor_blog/bloc/email/email_bloc.dart';
import 'package:interceptor_blog/bloc/home/home_bloc.dart';
import 'package:interceptor_blog/bloc/profile/profile_bloc.dart';
import 'package:interceptor_blog/presenatation/auth/login/login_page.dart';
import 'package:interceptor_blog/presenatation/email/email_page.dart';
import 'package:interceptor_blog/presenatation/profile/profile_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        tooltip: "Profile",
        onPressed: () {
          context.read<ProfileBloc>().add(ProfileFetchEvent());
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const ProfilePage(),
            ),
          );
        },
        child: const Icon(Icons.person),
      ),
      appBar: AppBar(
        leading: const SizedBox(),
        title: const Text("Users"),
        actions: [
          IconButton(
            tooltip: "Log Out",
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              context.read<AuthBloc>().add(LogOutRequested());
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => const LogInPage()),
                  (route) => false);
            },
          ),
        ],
      ),
      body: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is HomeLoggedOut) {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (_) => const LogInPage(),
              ),
              (route) => false,
            );
          }
        },
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is HomeError) {
              return Center(
                child: Text(state.message),
              );
            }
            if (state is HomeLoaded) {
              return ListView.builder(
                itemCount: state.users.length,
                itemBuilder: (context, index) {
                  final user = state.users[index];
                  return ListTile(
                    onTap: () {
                      context
                          .read<EmailBloc>()
                          .add(FetchEmailEvent(id: state.users[index].id));
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const EmailPage(),
                        ),
                      );
                    },
                    title: Text(user.name),
                    subtitle: Text(user.email),
                  );
                },
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
