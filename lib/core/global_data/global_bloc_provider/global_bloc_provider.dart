import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_finder/feature/house/presentation/blocs/house_bloc/house_bloc.dart';
import 'package:house_finder/feature/house/presentation/blocs/house_bloc/house_event.dart';
import 'package:house_finder/feature/login/data/repository_impl/auth_repository_impl.dart';
import 'package:house_finder/feature/login/domain/usecase/login_user_usecase.dart';
import 'package:house_finder/feature/login/presentation/bloc/login_bloc.dart';
import 'package:house_finder/feature/sign-up/data/datasource/auth_remote_datasource.dart'
    show SignUpAuthRemoteDatasource;
import 'package:house_finder/feature/sign-up/data/repository_impl/auth_repository_impl.dart';
import 'package:house_finder/feature/sign-up/domain/usecase/signup_user_usecase.dart';
import 'package:house_finder/feature/sign-up/presentation/bloc/signup_bloc.dart';
import 'package:provider/single_child_widget.dart';
import '../../../feature/login/data/datasource/auth_remote_datasource.dart';

interface class IGlobalBlocProvider {
  final firebaseAuth = FirebaseAuth.instance;
  //login
  late final LoginAuthRemoteDatasource loginRemoteDatasource;
  late final LoginAuthRepositoryImpl loginrepo;
  late final LoginUserUseCase loginUsecase;
  //sign up
  late final SignUpAuthRemoteDatasource signUpRemoteDatasource;
  late final SignUpAuthRepositoryImpl signUpRepo;
  late final SignupUserUsecase signUpUsecase;

  IGlobalBlocProvider() {
    //login ko lagi
    loginRemoteDatasource = LoginAuthRemoteDatasource(firebaseAuth);
    loginrepo = LoginAuthRepositoryImpl(loginRemoteDatasource);
    loginUsecase = LoginUserUseCase(loginrepo);
    //sign up ko lagi
    signUpRemoteDatasource = SignUpAuthRemoteDatasource(firebaseAuth);
    signUpRepo = SignUpAuthRepositoryImpl(signUpRemoteDatasource);
    signUpUsecase = SignupUserUsecase(signUpRepo);
  }

  List<SingleChildWidget> get globalBlocProvider => <SingleChildWidget>[
    BlocProvider(create: (_) => LoginBloc(loginUserUseCase: loginUsecase)),
    BlocProvider(create: (_) => SignupBloc(signupUserUsecase: signUpUsecase)),
    BlocProvider(create: (_) => HouseBloc()..add(const LoadCachedHouseEvent())),
  ];
}
