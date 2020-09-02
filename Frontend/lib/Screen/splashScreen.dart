import 'package:covid19elevate/Bloc/StatsBloc.dart';
import 'package:covid19elevate/Bloc/StatsEvent.dart';
import 'package:covid19elevate/Screen/home.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    StatsBloc _statBloc = BlocProvider.of<StatsBloc>(context);
    _statBloc.statsEventSink.add(GetInitialData());
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()));
    });
    return Scaffold(body: Container());
  }
}
