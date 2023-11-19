import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math' as math;
import 'package:auto_size_text/auto_size_text.dart';

class Booking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          child: Icon(Icons.arrow_back, color: Colors.black,),
          onTap :(){},

        ),
        title: Text('Book your private session', style: TextStyle(color: Colors.black),),
      ),
      body: TutorSelectionScreen(),
    );
  }
}

class TutorSelectionScreen extends StatefulWidget {
  @override
  _TutorSelectionScreenState createState() => _TutorSelectionScreenState();
}

class _TutorSelectionScreenState extends State<TutorSelectionScreen> {
  // Example tutor and their available dates
  Map<String, List<String>> tutorAvailability = {
    'John Doe': ['2023-04-20 18:30', '2023-04-23 20:30', '2023-04-25 22:30'],
    'Jane Smith': ['2023-04-21 15:00', '2023-04-24 16:00', '2023-04-26 17:00'],
    'Dave Wilson': ['2023-04-22 10:20', '2023-04-27 12:30', '2023-04-29 15:40'],
  };

  String? selectedTutor;
  String? selectedDate;
  String? sessionMethod;

  String formatDay(String date) {
    final DateFormat formatter = DateFormat('dd'); // Only day, e.g., "20"
    DateTime dateTime = DateTime.parse(date);
    return formatter.format(dateTime);
  }

  String formatMonth(String date) {
    final DateFormat formatter = DateFormat('MMM'); // Only month, e.g., "Apr"
    DateTime dateTime = DateTime.parse(date);
    return formatter.format(dateTime);
  }

  String formatHour24Minute(String date){
    final DateFormat formatter = DateFormat('Hm'); // Only hour and minute, e.g., "18:30"
    DateTime dateTime = DateTime.parse(date);
    return formatter.format(dateTime);
  }


  Widget dateCard(String date) {
    double screenHeight = MediaQuery.of(context).size.height;

    double cardWidth = 70.0; // Adjusted to a fixed value
    double cardHeight = math.max(screenHeight * 0.25, 40.0); // Keeping minimum height of 40

    bool isSelected = selectedDate == date;
    String formattedDay = formatDay(date);
    String formattedMonth = formatMonth(date);
    String formattedHourMinute = formatHour24Minute(date);

    return Container(
      width: cardWidth,
      height: cardHeight,
      child: Card(
        color: isSelected ? Color(0xFFF2CECD) : Colors.white,
        child: InkWell(
          onTap: () {
            setState(() {
              selectedDate = date;
            });
          },
          child: Padding(
            padding: EdgeInsets.all(4.0), // Adjusted padding
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: AutoSizeText(
                      formattedHourMinute,
                      maxLines: 1,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w300,
                      )
                  ),
                ),
                Expanded( // Wrap the Text in Expanded to fill the space within the Column
                  child: AutoSizeText(
                    formattedDay,
                    maxLines: 1,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded( // Wrap the Text in Expanded to fill the space within the Column
                  child: AutoSizeText(
                    formattedMonth,
                    maxLines: 1,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void bookSession() {
    // Placeholder for booking logic
    print('Booking with $selectedTutor on $selectedDate via $sessionMethod');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Book a Tutoring Session', style: TextStyle(color: Colors.black),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          DropdownButton<String>(
            hint: Text('Select Tutor'),
            value: selectedTutor,
            onChanged: (String? newValue) {
              setState(() {
                selectedTutor = newValue;
                selectedDate = null; // Reset date when changing tutor
              });
            },
            items: tutorAvailability.keys.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          if (selectedTutor != null) // Only show dates if a tutor is selected
            LayoutBuilder(
              builder: (context, constraints) {
                var cardWidth = 70.0;
                var cardCount = tutorAvailability[selectedTutor]!.length;
                var totalCardWidth = cardCount * cardWidth;

                // Decide if we need to center the cards manually or use the ListView
                if (totalCardWidth < constraints.maxWidth) {
                  // Not enough cards to fill the screen width, so center using a Row
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: tutorAvailability[selectedTutor]!.map<Widget>((String date) {
                      return Container(
                        height: math.max(MediaQuery.of(context).size.height * 0.10, 70),
                        width: cardWidth,
                        child: dateCard(date),
                      );
                    }).toList(),
                  );
                } else {
                  // Enough cards to require scrolling, so use ListView
                  return Container(
                    height: math.max(MediaQuery.of(context).size.height * 0.10, 70),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: tutorAvailability[selectedTutor]!.length,
                      itemBuilder: (BuildContext context, int index) {
                        String date = tutorAvailability[selectedTutor]![index];
                        return Container(
                          width: cardWidth,
                          child: dateCard(date),
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ListTile(
            title: const Text('Video'),
            leading: Radio<String>(
              value: 'video',
              groupValue: sessionMethod,
              onChanged: (String? value) {
                setState(() {
                  sessionMethod = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Chat'),
            leading: Radio<String>(
              value: 'chat',
              groupValue: sessionMethod,
              onChanged: (String? value) {
                setState(() {
                  sessionMethod = value;
                });
              },
            ),
          ),
          ElevatedButton(
            onPressed: (selectedTutor != null &&
                selectedDate != null &&
                sessionMethod != null)
                ? bookSession
                : null,
            child: Text('Book Session'),
          ),
        ],
      ),
    );
  }
}
