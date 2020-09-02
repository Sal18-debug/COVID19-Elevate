import 'package:covid19elevate/Bloc/StatsBloc.dart';
import 'package:covid19elevate/Model/globalCase.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class GlobalStats extends StatelessWidget {
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
                  'Global',
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
      body: StreamBuilder<GlobalCase>(
        stream: _statsBloc.gStatsStream,
        initialData: _statsBloc.getGlobalCase,
        builder: (context, global) {
          if (global.hasData) {
            if (global.hasError) {
              return Center(
                child: Text("400 Error"),
              );
            } else {
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
                      Shimmer(
                        child: Container(
                          height: MediaQuery.of(context).size.height / 6,
                          width: 480,
                          decoration: BoxDecoration(
                            // gradient: LinearGradient(
                            //   colors: [
                            //     Color(0xFFF83F38),
                            //     Colors.black87,
                            //   ],
                            // ),
                            color: Color(0xFFF83F38),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                "Confirmed",
                                overflow: TextOverflow.clip,
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "${global.data.total_cases}",
                                style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Shimmer(
                        child: Container(
                          height: MediaQuery.of(context).size.height / 6,
                          width: 480,
                          decoration: BoxDecoration(
                            // color: Color(),
                            // gradient: LinearGradient(
                            //   colors: [
                            //     Color(0xFF0278F9),
                            //     Colors.black87,
                            //   ],
                            // ),
                            color: Color(0xFF0278F9),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                "Active",
                                overflow: TextOverflow.clip,
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.white,
                                  // color: Color(0xFF0278F9),
                                ),
                              ),
                              Center(
                                child: Text(
                                  "${global.data.active_cases}",
                                  style: GoogleFonts.montserrat(
                                    // color: Color(0xFF0278F9),
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Shimmer(
                        child: Container(
                          height: MediaQuery.of(context).size.height / 6,
                          width: 480,
                          decoration: BoxDecoration(
                            // color: Color(0xFF41A745),
                            // gradient: LinearGradient(
                            //   colors: [
                            //     Color(0xFF41A745),
                            //     Colors.black87,
                            //   ],
                            // ),
                            color: Color(0xFF41A745),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                "Recovered",
                                overflow: TextOverflow.clip,
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  // color: Color(0xFF41A745),
                                  color: Colors.white,
                                ),
                              ),
                              Center(
                                child: Text(
                                  "${global.data.total_recovered}",
                                  style: GoogleFonts.montserrat(
                                    // color: Color(0xFF41A745),
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Shimmer(
                        child: Container(
                          height: MediaQuery.of(context).size.height / 6,
                          width: 480,
                          decoration: BoxDecoration(
                            // color: Color(0xFF6B747C),
                            // gradient: LinearGradient(
                            //   colors: [
                            //     Color(0xFF6B747C),
                            //     Colors.black87,
                            //   ],
                            // ),
                            color: Color(0xFF6B747C),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                "Decreased",
                                overflow: TextOverflow.clip,
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  // color: Color(0xFF6B747C),
                                  color: Colors.white,
                                ),
                              ),
                              Center(
                                child: Text(
                                  "${global.data.total_recovered}",
                                  style: GoogleFonts.montserrat(
                                    // color: Color(0xFF6B747C),
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
