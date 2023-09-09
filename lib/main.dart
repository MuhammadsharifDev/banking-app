import 'package:banking_app/data/repository/card_repository.dart';
import 'package:banking_app/presintation/main/addcard/bloc/card_bloc.dart';
import 'package:banking_app/presintation/main/home/cubit/getcard_cubit.dart';
import 'package:banking_app/route/app_routes.dart';
import 'package:banking_app/route/routes_name.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddcardBloc(
            cardRepository: CardRepository(
              firestore: FirebaseFirestore.instance,
            ),
          ),
        ),
        BlocProvider(
          create: (context) => GetCardCubit(
            cardRepository:
                CardRepository(firestore: FirebaseFirestore.instance),
          ),
        ),
      ],
      child: KeyboardDismisser(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          initialRoute: RoutesName.signup,
          onGenerateRoute: AppRoutes.onGenerateRoute,
        ),
      ),
    );
  }
}
