import 'package:fin_app/data/db/db.dart';
import 'package:fin_app/di/injection.dart';
import 'package:fin_app/presentation/logic/bloc_provider_singleton.dart';
import 'package:fin_app/presentation/routes/router.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await _initApp();
  runApp(const FinApp());
}

_initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppLocalDB.initiallize();
  await configureInjection();
  BlocProviderSingleton.initialize();
  await Firebase.initializeApp();
}

class FinApp extends StatelessWidget {
  const FinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: BlocProviderSingleton.instance.authCubit),
        BlocProvider.value(value: BlocProviderSingleton.instance.userCubit),
        BlocProvider.value(value: BlocProviderSingleton.instance.dummyCubit),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRouter.SPLASH_SCREEN,
        onGenerateRoute: AppRouter.onGenrateRoute,
      ),
    );
  }
}
