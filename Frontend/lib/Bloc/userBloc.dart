import 'dart:async';
import 'dart:convert';
import 'package:covid19elevate/Bloc/userEvent.dart';
import 'package:covid19elevate/Model/user.dart';
import 'package:covid19elevate/const.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserBloc extends Bloc {
  User _user;
  User get getUser => _user;

  StreamController<User> _userController = StreamController<User>.broadcast();
  StreamSink<User> get userESink => _userController.sink;
  Stream<User> get userStream => _userController.stream;

  StreamController<UserEvent> _userEventController =
      StreamController<UserEvent>.broadcast();
  StreamSink<UserEvent> get userEventSink => _userEventController.sink;
  Stream<UserEvent> get userEventStream => _userEventController.stream;

  UserBloc() {
    userEventStream.listen(_mapEventToStream);
  }
  Future<void> _mapEventToStream(UserEvent event) async {}

  Future<bool> loginUser(String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool status;
    Map<String, String> header = {
      "Content-type": "application/json",
    };
    http.Response response = await http.post(
      loginEndpoint,
      headers: header,
      body: '''{"email":"$email","password":"$password"}''',
    );
    if (response.statusCode == 200) {
      var map = jsonDecode(response.body)["data"];
      _user = User.fromMap(map);
      await prefs.setString('id', _user.id);
      status = true;
    } else {
      Fluttertoast.showToast(msg: "Wrong Email or Password");
      status = false;
    }
    return status;
  }

  Future<bool> registerUser(String password, String name, String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool status;
    Map<String, String> header = {
      "Content-type": "application/json",
    };
    http.Response response = await http.post(
      registerEndpoint,
      headers: header,
      body: '''{"name":"$name","email":"$email","password":"$password"}''',
    );
    if (response.statusCode == 200) {
      var map = jsonDecode(response.body)["data"];
      _user = User.fromMap(map);
      await prefs.setString('id', _user.id);
      status = true;
    } else {
      status = false;
      Fluttertoast.showToast(msg: "Something went wrong");
    }
    return status;
  }

  @override
  void dispose() {
    _userController.close();
    _userEventController.close();
  }
}
