import 'package:covid19elevate/Bloc/StatsBloc.dart';
import 'package:covid19elevate/Bloc/StatsEvent.dart';
import 'package:covid19elevate/Screen/home.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:getwidget/components/button/gf_button.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    StatsBloc _statsBloc = BlocProvider.of<StatsBloc>(context);
    return Container(
      child: Center(
        child: GFButton(onPressed: () {
          _statsBloc.statsEventSink.add(GetInitialData());
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Home()));
        }),
      ),
    );
  }
}
