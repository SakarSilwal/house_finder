import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_finder/feature/sign-up/presentation/bloc/signup_bloc.dart';
import 'package:house_finder/feature/sign-up/presentation/widget/sign_up_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Signup screen'),
        centerTitle: true,
        // actions: [
        // BlocBuilder<ThemeCubit, ThemeState>(
        //   builder: (context, state) {
        //     ThemeMode themeMode = ThemeMode.light;
        //     if (state is ThemeChange) {
        //       themeMode = state.themeMode;
        //     }
        //     return IconButton(
        //       onPressed: () {
        //         context.read<ThemeCubit>().toggleTheme();
        //       },
        //       icon: Icon(
        //         state is ThemeChange ? Icons.light_mode : Icons.dark_mode,
        //       ),
        //     );
        //   },
        // ),

        // BlocBuilder<ThemeBloc, ThemeState>(
        //   builder: (context, state) {
        //     String currentTheme = 'light';
        //     if (state is LightThemeState) {
        //       currentTheme = 'light';
        //     } else {
        //       currentTheme = 'dark';
        //     }
        //     return IconButton(
        //       onPressed: () {
        //         context.read<ThemeBloc>().add(ToggleThemeEvent());
        //       },
        //       icon: Icon(
        //         state is LightThemeState ? Icons.light_mode : Icons.dark_mode,
        //       ),
        //     );
        //   },
        //   // ),
        //   BlocBuilder<LanguageCubit, LanguageState>(
        //     builder: (context, state) {
        //       Locale locale = const Locale('en'); // by default

        //       if (state is LanguageChanged) {
        //         locale = state.selectLanguage;
        //       }
        //       return PopupMenuButton<String>(
        //         icon: Icon(Icons.language),
        //         onSelected: (value) {
        //           if (value == 'en') {
        //             context.read<LanguageCubit>().changeLanguage('ne');
        //           } else if (value == 'ne') {
        //             context.read<LanguageCubit>().changeLanguage('en');
        //           }
        //         },

        //         itemBuilder:
        //             (context) => [
        //               PopupMenuItem(
        //                 value: 'en',
        //                 child: Row(
        //                   children: [
        //                     if (currentLanguage == 'en')
        //                       Icon(Icons.check, size: 16),
        //                     Text("English"),
        //                   ],
        //                 ),
        //               ),
        //               PopupMenuItem(
        //                 value: 'ne',
        //                 child: Row(
        //                   children: [
        //                     if (currentLanguage == 'ne')
        //                       Icon(Icons.check, size: 16),
        //                     Text("नेपाली"),
        //                   ],
        //                 ),
        //               ),
        //             ],
        //       );
        //     },
        //   ),
        // ],
      ),
      body: BlocBuilder<SignupBloc, SignupState>(
        builder: (context, state) {
          return SignUpWidget(state: state);
        },
      ),
    );
  }
}
