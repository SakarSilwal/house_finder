import 'package:go_router/go_router.dart';
import 'package:house_finder/core/config/routing/route_name.dart';
import 'package:house_finder/feature/house/presentation/screens/main_nav_screen.dart';
import 'package:house_finder/feature/login/presentation/screen/login_screen.dart';

GoRouter get router => GoRouter(
  //initial route ko name dine yesari
  initialLocation: RouteName.homeScreenRoute,
  routes: <GoRoute>[
    GoRoute(
      path: RouteName.loginRoute,
      builder: (context, state) {
        return LoginScreen();
      },
    ),
    GoRoute(
      path: RouteName.homeScreenRoute,
      builder: (context, state) {
        return MainNavScreen();
      },
    ),
    // GoRoute(
    //   path: RouteName.signUpRoute,
    //   builder: (context, state) {
    //     return SignUpScreen();
    //   },
    // ),
    // GoRoute(
    //   path: RouteName.dashboardRoute,
    //   builder: (context, state) {
    //     return DashboardScreen();
    //   },
    // ),

    // GoRoute(
    //   path: RouteName.forgotPasswordRoute,
    //   builder: (context, state) {
    //     return ForgotPasswordScreen();
    //   },
    // ),

    // GoRoute(
    //   path: RouteName.verifyEmailRoute,
    //   builder: (context, state) {
    //     return EmailVerifyScreen(email: '');
    //   },
    // ),

    // GoRoute(
    //   path: RouteName.myProfileRoute,
    //   builder: (context, state) {
    //     return MyProfileScreen();
    //   },
    // ),

    // GoRoute(
    //   path: RouteName.myProfileSettingsRoute,
    //   builder: (context, state) {
    //     return ProfileSettingScreen();
    //   },
    // ),
  ],
);
