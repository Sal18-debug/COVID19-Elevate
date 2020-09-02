import 'package:covid19elevate/Bloc/StatsBloc.dart';
import 'package:covid19elevate/Bloc/userBloc.dart';
import 'package:covid19elevate/Screen/home.dart';
import 'package:covid19elevate/Screen/splashScreen.dart';
import 'package:covid19elevate/Screen/welcome.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: StatsBloc(),
      child: BlocProvider(
        bloc: UserBloc(),
        child: MaterialApp(
          title: 'Covid19 Elevate',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: Welcome(),
        ),
      ),
    );
  }
}
