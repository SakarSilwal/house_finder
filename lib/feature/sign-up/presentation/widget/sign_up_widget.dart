import 'dart:developer' show log;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:house_finder/common/widgets/ft_button_widget.dart';
import 'package:house_finder/common/widgets/ft_text_form_widget.dart';
import 'package:house_finder/core/constants/app_colors.dart';
import 'package:house_finder/feature/house/auth/auth_service.dart';
import 'package:house_finder/feature/house/presentation/screens/house_home_screen.dart';
import 'package:house_finder/feature/login/presentation/screen/login_screen.dart';
import 'package:house_finder/feature/sign-up/presentation/bloc/signup_bloc.dart';
import 'package:house_finder/feature/sign-up/presentation/bloc/signup_event.dart';

class SignUpWidget extends StatelessWidget {
  final SignupState state;

  SignUpWidget({required this.state, super.key});

  final _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ValueNotifier<bool> obscureTextNotifier = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormWidget(
                  controller: _userNameController,
                  labelText: 'username',
                  hintText: 'username',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'username';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 15),
                TextFormWidget(
                  controller: _emailController,
                  labelText: 'email',
                  hintText: 'email',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                ValueListenableBuilder<bool>(
                  valueListenable: obscureTextNotifier,
                  builder: (context, obscureText, child) {
                    return TextFormWidget(
                      controller: _passwordController,
                      labelText: 'Password',
                      hintText: 'Password',
                      obscureText: obscureText,
                      suffixIcon: IconButton(
                        icon: Icon(
                          obscureText ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          obscureTextNotifier.value =
                              !obscureTextNotifier.value;
                        },
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password';
                        }
                        return null;
                      },
                    );
                  },
                ),
                SizedBox(height: 15),

                BlocListener<SignupBloc, SignupState>(
                  listener: (context, state) {
                    final signupState = context.read<SignupBloc>().state;
                    if (signupState is SignupSuccess) {
                      // Show snackbar
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('signup successful')),
                      );

                      // Navigate
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    } else if (signupState is SignupFailure) {
                      // Show error snackbar
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error: ${signupState.error}')),
                      );
                    }
                  },
                  child: state is SignupLoading
                      ? CircularProgressIndicator()
                      : CustomButton(
                          height: 50,
                          width: double.infinity,
                          onPressed: () async {
                            if (_formKey.currentState != null &&
                                _formKey.currentState!.validate()) {
                              context.read<SignupBloc>().add(
                                SignupRequested(
                                  username: _userNameController.text.trim(),
                                  email: _emailController.text.trim(),
                                  password: _passwordController.text.trim(),
                                ),
                              );
                            }
                          },
                          backgroundColor: AppColors.buttonColor.darkModeColor,
                          foregroundColor:
                              AppColors.backgroundColor.lightModeColor,
                          text: 'sign up',
                          textColor: AppColors.backgroundColor.lightModeColor,
                        ),
                ),

                SizedBox(height: 15),
                Text('or', style: TextStyle(color: Colors.grey, fontSize: 22)),
                SizedBox(height: 15),
                CustomButton(
                  height: 50,
                  width: double.infinity,
                  onPressed: () async {
                    try {
                      await _auth.signInWithGoogle();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HouseHomeScreen(),
                        ),
                      );
                      await GoogleSignIn().signOut();
                      // yo chai kina rakheko vandha signup with google garesi home page ma pugyo
                      //ani app bata bahira niskera sign up with google garda sidhai home ma pathai dinxa
                      // tyo account choose garne pheri sign up with google screen  dekhaudaina tei vaera
                    } catch (e) {
                      log("Google Sign In ma xau $e");
                    }
                  },
                  backgroundColor: AppColors.backgroundColor.lightModeColor,
                  // foregroundColor: AppColors.backgroundColor.lightModeColor,
                  text: 'sign up with google',
                  fontWeight: FontWeight.bold,
                  textSize: 13,
                  textColor: AppColors.backgroundColor.darkModeColor,
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'already account',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: 6),
                    InkWell(
                      child: Text(
                        'login',
                        style: TextStyle(
                          color: AppColors.buttonColor.darkModeColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
