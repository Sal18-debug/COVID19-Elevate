import 'package:covid19elevate/Bloc/StatsBloc.dart';
import 'package:covid19elevate/Model/countryCase.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:google_fonts/google_fonts.dart';

class CountryStats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    StatsBloc _statsBloc = BlocProvider.of<StatsBloc>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  'Countries',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF325384),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Stats',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ],
        ),
        elevation: 0,
      ),
      body: StreamBuilder<List<CountryCase>>(
        stream: _statsBloc.cStatsStream,
        initialData: _statsBloc.getCountryStats,
        builder: (context, country) {
          if (country.hasData) {
            if (country.hasError) {
              return Center(
                child: Text("400 Error"),
              );
            } else {
              return country.data.length == 0
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Scrollbar(
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: country.data.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: 480,
                                    child: Text(
                                      country.data[index].country_name,
                                      overflow: TextOverflow.clip,
                                      style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color: Color(0xFF325399),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        "Confirmed: ",
                                        style: GoogleFonts.montserrat(
                                          color: Color(0xFFF83F38),
                                          fontSize: 13,
                                          // fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "${country.data[index].cases}",
                                        style: GoogleFonts.montserrat(
                                          color: Color(0xFFF83F38),
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        "Active: ",
                                        style: GoogleFonts.montserrat(
                                          color: Color(0xFF0278F9),
                                          fontSize: 13,
                                          // fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "${country.data[index].active_cases}",
                                        style: GoogleFonts.montserrat(
                                          color: Color(0xFF0278F9),
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        "Recovered: ",
                                        style: GoogleFonts.montserrat(
                                          color: Color(0xFF41A745),
                                          fontSize: 13,
                                          // fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "${country.data[index].total_recovered}",
                                        style: GoogleFonts.montserrat(
                                          color: Color(0xFF41A745),
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        "Decreased: ",
                                        style: GoogleFonts.montserrat(
                                          color: Color(0xFF6B747C),
                                          fontSize: 13,
                                          // fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "${country.data[index].deaths}",
                                        style: GoogleFonts.montserrat(
                                          color: Color(0xFF6B747C),
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
            }
          } else {
            return Center(
              child: Text("404 NO FOUND"),
            );
          }
        },
      ),
    );
  }
}
