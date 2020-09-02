import 'dart:async';
import 'dart:convert';
import 'package:covid19elevate/Bloc/StatsEvent.dart';
import 'package:covid19elevate/Model/countryCase.dart';
import 'package:covid19elevate/Model/globalCase.dart';
import 'package:covid19elevate/const.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:http/http.dart' as http;

class StatsBloc extends Bloc {
  List<CountryCase> _countryStats;
  List<CountryCase> get getCountryStats => _countryStats;

  GlobalCase _globalCase;
  GlobalCase get getGlobalCase => _globalCase;

  StreamController<List<CountryCase>> _cStatsController =
      StreamController<List<CountryCase>>.broadcast();
  StreamSink<List<CountryCase>> get cStatsSink => _cStatsController.sink;
  Stream<List<CountryCase>> get cStatsStream => _cStatsController.stream;

  StreamController<GlobalCase> _gStatsController =
      StreamController<GlobalCase>.broadcast();
  StreamSink<GlobalCase> get gStatsSink => _gStatsController.sink;
  Stream<GlobalCase> get gStatsStream => _gStatsController.stream;

  StreamController<StatsEvent> _statsController =
      StreamController<StatsEvent>.broadcast();
  StreamSink<StatsEvent> get statsEventSink => _statsController.sink;
  Stream<StatsEvent> get statsEventStream => _statsController.stream;

  StatsBloc() {
    statsEventStream.listen(_mapEventToStrem);
  }

  Future<void> _mapEventToStrem(StatsEvent event) async {
    if (event is GetInitialData) {
      _countryStats = List<CountryCase>();
      Map<String, String> header = {
        "Content-type": "application/json",
        "x-rapidapi-key": apiKey,
        "x-rapidapi-host": hostName
      };
      http.Response response = await http.get(
        countryEndPoint,
        headers: header,
      );

      http.Response gResponse = await http.get(
        globalEndPoint,
        headers: header,
      );
      if (gResponse.statusCode == 200) {
        var map = jsonDecode(gResponse.body);
        print(map);
        _globalCase = GlobalCase.fromMap(map);
      }
      if (response.statusCode == 200) {
        var map = jsonDecode(response.body)["countries_stat"];
        for (var i = 0; i < map.length; i++) {
          _countryStats.add(CountryCase.fromMap(map[i]));
        }
      }

      gStatsSink.add(_globalCase);
      cStatsSink.add(_countryStats);
    }
  }

  @override
  void dispose() {
    _statsController.close();
    _cStatsController.close();
    _gStatsController.close();
  }
}
