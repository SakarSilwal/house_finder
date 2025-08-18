import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_finder/feature/login/presentation/bloc/login_bloc.dart';
import 'package:house_finder/feature/login/presentation/widget/login_screen_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text('Login Screen'), centerTitle: true),

      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Center(
            child: LoginScreenWidget(
              state: state, // Pass state to the widget
            ),
          );
        },
      ),
    );
  }
}
