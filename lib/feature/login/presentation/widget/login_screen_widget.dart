//yo aafai halne hai for AppLocalizations

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_finder/common/widgets/ft_button_widget.dart';
import 'package:house_finder/common/widgets/ft_text_form_widget.dart';
import 'package:house_finder/core/constants/app_colors.dart';
import 'package:house_finder/feature/house/presentation/screens/main_nav_screen.dart';
import 'package:house_finder/feature/login/presentation/bloc/login_bloc.dart';
import 'package:house_finder/feature/sign-up/presentation/screen/sign_up_screen.dart';

class LoginScreenWidget extends StatelessWidget {
  final LoginState state; // Add this

  LoginScreenWidget({
    required this.state, // Constructor param
    super.key,
  });

  final _formKey = GlobalKey<FormState>();
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
                  controller: _emailController,
                  labelText: 'email',
                  hintText: 'email',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please login with your email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),

                ValueListenableBuilder<bool>(
                  valueListenable: obscureTextNotifier,
                  builder: (context, obscureText, child) {
                    return TextFormWidget(
                      controller: _passwordController,
                      labelText: 'password',
                      hintText: 'password',
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
                          return 'enter your password';
                        }
                        return null;
                      },
                    );
                  },
                ),

                SizedBox(height: 10),

                BlocListener<LoginBloc, LoginState>(
                  listener: (context, state) {
                    final loginState = context.read<LoginBloc>().state;
                    if (loginState is LoginSuccess) {
                      // Show snackbar
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('login successful')),
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainNavScreen(),
                        ),
                      );
                    } else if (loginState is LoginFailure) {
                      // Show error snackbar
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error: ${loginState.error}')),
                      );
                    }
                  },
                  child: state is LoginLoading
                      ? CircularProgressIndicator()
                      : CustomButton(
                          height: 50,
                          width: double.infinity,
                          onPressed: () async {
                            if (_formKey.currentState != null &&
                                _formKey.currentState!.validate()) {
                              context.read<LoginBloc>().add(
                                LoginRequested(
                                  email: _emailController.text.trim(),
                                  password: _passwordController.text.trim(),
                                ),
                              );
                            }
                          },
                          backgroundColor: AppColors.buttonColor.darkModeColor,
                          foregroundColor:
                              AppColors.backgroundColor.lightModeColor,
                          text: 'login',
                          textColor: AppColors.backgroundColor.lightModeColor,
                        ),
                ),

                SizedBox(height: 10),

                SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'already have an account? ',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 10),

                    InkWell(
                      child: Text(
                        'sign up',
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
                            builder: (context) => const SignUpScreen(),
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

// import 'package:flutter/material.dart';
// import 'package:house_finder/feature/house/presentation/screens/house_home_screen.dart';
// import 'package:house_finder/feature/login/presentation/bloc/login_bloc.dart';

// class LoginScreenWidget extends StatelessWidget {
//   final LoginState state;
//   const LoginScreenWidget({super.key, required this.state});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Expanded(
//           child: ListView(
//             physics: NeverScrollableScrollPhysics(),
//             children: [
//               Column(
//                 children: [
//                   Image.asset('assets/images/real_state.jpg'),
//                   SizedBox(height: 44),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 12),
//                     child: TextFormField(
//                       decoration: InputDecoration(
//                         hintText: 'Email',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(16),
//                         ),
//                       ),
//                     ),
//                   ),

//                   SizedBox(height: 10),

//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 12),
//                     child: TextFormField(
//                       decoration: InputDecoration(
//                         hintText: 'Password',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(16),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 10),

//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(right: 12),
//                         child: Text('Forgot Password?'),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 10),

//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => HouseHomeScreen(),
//                         ),
//                       );
//                     },
//                     child: Container(
//                       height: 52,
//                       width: 354,
//                       decoration: BoxDecoration(
//                         color: Color(0xFF3498DB),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Center(
//                         child: Text(
//                           'Log In',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   Text(
//                     '____________________ Sign in with ____________________',
//                     style: TextStyle(color: Colors.grey),
//                   ),
//                   SizedBox(height: 20),

//                   Container(
//                     height: 52,
//                     width: 354,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       border: Border.all(color: Colors.red, width: 2),
//                     ),
//                     child: Row(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(left: 10),
//                           child: Image.asset(
//                             'assets/images/google.jpeg',
//                             height: 35,
//                             width: 35,
//                           ),
//                         ),
//                         SizedBox(width: 105),
//                         Center(
//                           child: Text(
//                             'Google',
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               color: Colors.red,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 10),

//                   Container(
//                     height: 52,
//                     width: 354,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       border: Border.all(color: Colors.blue, width: 2),
//                     ),
//                     child: Row(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(left: 10),
//                           child: Image.asset(
//                             'assets/images/facebook.jpeg',
//                             height: 33,
//                             width: 35,
//                           ),
//                         ),
//                         SizedBox(width: 100),
//                         Center(
//                           child: Text(
//                             'Facebook',
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               color: Colors.blue,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
