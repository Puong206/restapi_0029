import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restapi_0029/logic/bloc/auth/auth_bloc.dart';
import 'package:restapi_0029/logic/bloc/auth/auth_state.dart';
import 'package:restapi_0029/data/repositories/auth_repository.dart';
import 'package:restapi_0029/ui/pages/dashboard_page.dart';
import 'package:restapi_0029/ui/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(repository: AuthRepository()),
      child: MaterialApp(
        title: 'Restapi 0029',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is Authenticated) {
              return const DashboardPage();
            } else {
              return const LoginPage();
            }
          },
        ),
      ),
    );
  }
}
