// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:house_finder/core/config/routing/navigation_service.dart';
import 'package:house_finder/core/config/routing/route_config.dart';
import 'package:house_finder/core/di/service_locator.dart';
import 'package:house_finder/core/global_data/global_bloc_provider/global_bloc_provider.dart';
import 'package:house_finder/feature/house/data/models/house_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //initialized firebase here
  await Firebase.initializeApp();
  // initzd hive
  await Hive.initFlutter();
  //for registring hive adapter
  Hive.registerAdapter(HouseModelAdapter());

  //now have to open boxes
  await Hive.openBox<HouseModel>('houses');
  await Hive.openBox<HouseModel>('favourites');

  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      key: locator<NavigationService>().navigatorKey,
      providers: IGlobalBlocProvider().globalBlocProvider,
      child: MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        // home: LoginScreen(),
      ),
    );
  }
}
