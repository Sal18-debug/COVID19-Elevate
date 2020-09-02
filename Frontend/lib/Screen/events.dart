import 'package:covid19elevate/const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:url_launcher/url_launcher.dart';

class Events extends StatefulWidget {
  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  'Events',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF325384),
                  ),
                ),
              ],
            ),
          ],
        ),
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, i) {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Shimmer(
                child: InkWell(
                  onTap: () {
                    launch("${link[i]}");
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height / 6,
                    width: 480,
                    decoration: BoxDecoration(
                      color: color[i],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          "${list[i]}",
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
              ),
            );
          }),
    );
  }
}
