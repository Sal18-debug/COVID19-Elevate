import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:url_launcher/url_launcher.dart';

class Events extends StatefulWidget {
  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
  List<String> list = [
    "My Piggy for School",
    "Kids Zone",
    "Adult Zone",
    "Senior Citizen Zone",
    "Meet Up Groups",
    "COVID19 Tips and Resource"
  ];
  List<String> link = [
    "https://www.helpteaching.com/free-printable-worksheets.html",
    "https://www.businessinsider.com/online-activities-to-occupy-kids-during-quarantine-coronavirus-pandemic-2020-4",
    "https://work.chron.com/list-vocational-careers-14125.html",
    "https://www.google.com/",
    "https://www.meetup.com/topics/covid-19/",
    "https://www.google.com/"
  ];
  List<Color> color = [
    Color(0xFFE44236),
    Color(0xFF0A79DF),
    Color(0xFF26ae60),
    Color(0xFFF3B431),
    Color(0xFF2C3335),
    Color(0xFFE74292),
  ];
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
