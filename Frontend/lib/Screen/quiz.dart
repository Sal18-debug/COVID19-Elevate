import 'package:covid19elevate/Bloc/StatsBloc.dart';
import 'package:covid19elevate/Model/quizModel.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<bool> answers = List<bool>();
  PageController controller = PageController(initialPage: 0, keepPage: true);
  @override
  Widget build(BuildContext context) {
    StatsBloc _statsBloc = BlocProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  'Covid19',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF325384),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Quiz',
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
      body: StreamBuilder<List<QuizModel>>(
        stream: _statsBloc.quizStream,
        initialData: _statsBloc.getAllQuiz,
        builder: (context, snapshot) {
          for (var item in snapshot.data) {
            if (answers.length != snapshot.data.length) {
              answers.add(null);
            }
          }
          return Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: snapshot.data.length,
                  controller: controller,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, page) {
                    return Center(
                      child: ListView(
                        shrinkWrap: true,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Center(
                              child: Text(
                                '${snapshot.data[page].question}',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data[page].options.length,
                            itemBuilder: (context, i) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GFButton(
                                  fullWidthButton: true,
                                  onPressed: () {
                                    if (snapshot.data[page].options[i] ==
                                        snapshot.data[page].ans) {
                                      setState(() {
                                        answers[page] = true;
                                      });
                                      controller.jumpToPage(page + 1);
                                    } else {
                                      setState(() {
                                        answers[page] = false;
                                      });
                                      controller.jumpToPage(page + 1);
                                    }
                                  },
                                  text: snapshot.data[page].options[i],
                                  shape: GFButtonShape.standard,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: answers.map((e) {
                  if (e == null) {
                    return Text("⏺");
                  } else if (e) {
                    return Text("🎯");
                  } else {
                    return Text("🚫");
                  }
                }).toList(),
              ),
              SizedBox(height: 30),
            ],
          );
        },
      ),
    );
  }
}
