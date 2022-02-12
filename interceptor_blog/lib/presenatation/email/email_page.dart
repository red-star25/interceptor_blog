import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interceptor_blog/bloc/email/email_bloc.dart';

class EmailPage extends StatelessWidget {
  const EmailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Email'),
      ),
      body: BlocBuilder<EmailBloc, EmailState>(
        builder: (context, state) {
          if (state is EmailLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is EmailError) {
            return Center(
              child: Text(state.error),
            );
          }
          if (state is EmailLoaded) {
            return Center(
              child: Text(state.email),
            );
          }
          return Container();
        },
      ),
    );
  }
}
