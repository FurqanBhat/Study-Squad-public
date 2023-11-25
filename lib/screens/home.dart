import 'package:flutter/material.dart';
import 'package:study_squad/screens/bookings.dart';
import 'package:study_squad/screens/bookmarks.dart';
import 'package:study_squad/screens/profile.dart';
class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index=0;

  @override
  Widget build(BuildContext context) {
    List<Widget> pages=[
      HomeScreen(),Booking(), Bookmarks(), Profile(homeContext: context,)
    ];
    return MaterialApp(
      home: Scaffold(
        body: pages[index],
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 28,
          showSelectedLabels: true,
          type: BottomNavigationBarType.shifting,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          selectedFontSize: 15,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.w700),
          currentIndex: index,
          onTap: (value) {
            setState(() {
              index=value;
            });

          },
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'Search',
              icon: Icon(Icons.search),
            ),
            BottomNavigationBarItem(
              label: 'Favorite',
              icon: Icon(Icons.favorite),
            ),
            BottomNavigationBarItem(
              label: 'Person',
              icon: Icon(Icons.person),
            ),
          ],
        ),

      ),
    );
  }
}

class BoxContainer extends StatelessWidget {
  final String number;
  final String text;
  const BoxContainer({required this.number, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 241, 205, 204),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              number,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 5,),
            Text(
              text,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w300,
              ),
            )
          ]
      ),
    );
  }
}

class downBox extends StatelessWidget {
  final String agendaActions;
  final String course;
  final String time;
  final IconData physicalOnline;
  final String classFormat;

  const downBox({
    required this.agendaActions,
    required this.classFormat,
    required this.course,
    required this.physicalOnline,
    required this.time
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(left: 10.0, right: 10.0),
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.0),
        color: const Color.fromARGB(255, 241, 205, 204),
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                OutlinedButton(
                  style: const ButtonStyle(
                    padding: MaterialStatePropertyAll(EdgeInsets.all(2)),
                    fixedSize: MaterialStatePropertyAll(Size.fromWidth(40)),
                    backgroundColor: MaterialStatePropertyAll(Colors.white),
                    foregroundColor: MaterialStatePropertyAll(Colors.black),
                  ),
                  onPressed: () {},
                  child: Text(
                    agendaActions,
                  ),
                ),
                const SizedBox(
                  width: 80,
                ),
                Icon(
                  physicalOnline,
                  size: 25,
                ),
                const SizedBox(
                  width: 80,
                ),
                Text(
                  classFormat,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8,),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: Text(
                course,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Row(
              children: [
                Text(
                  time,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(
                  width: 130,
                ),
                const Icon(
                  Icons.notifications,
                  size: 35,
                ),
              ],
            )
          ]
      ),

    );
  }
}

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: CircleAvatar(
          radius: 50,
          backgroundColor: Colors.transparent,
          child: ClipOval(
              child: Image.network(
                'https://th.bing.com/th/id/R.c3470df7457cc93c9de8784644843884?rik=1rPldIM9Jb%2fL5w&pid=ImgRaw&r=0',
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              )
          ),
        ),
        title: const Text(
          'Find a tutor',
          style: TextStyle(
            color: Colors.black,
          ),),
        centerTitle: true,
        actions: [Container(
          alignment: Alignment.centerRight,
          child: IconButton(
            icon: const Icon(
                Icons.menu,
                color: Colors.black
            ),
            onPressed: () {},
          ),
        )],
      ),
      body: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black12,
          ),
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
        ),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                    padding: EdgeInsets.only(left: 20.0, top: 20.0, bottom: 20.0),
                    child: Text(
                      'Welcome, StudySquad',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    )
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  height: 130,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 5,
                        child: BoxContainer(number: "7", text: "Upcoming\nSessions"),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        flex: 7,
                        child: BoxContainer(number: "16", text: "Pending\nAssignments"),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  height: 130,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 7,
                        child: BoxContainer(number: "3", text: "New\nCourses"),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        flex: 5,
                        child: BoxContainer(number: "1", text: "New\nMessage"),
                      )
                    ],
                  ),
                ),
                const Padding(
                    padding: EdgeInsets.all(25),
                    child: Text(
                      "Today's Agenda",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    )
                ),
                const downBox(agendaActions: 'Book', classFormat: 'Online', course: 'MATH 101', physicalOnline: Icons.language, time: '9:30 AM - 11:00 AM'),
                const SizedBox(
                  height: 1,
                ),
                const downBox(agendaActions: 'Join', classFormat: 'Classroom', course: 'Vocabulary review', physicalOnline: Icons.map, time: '1:00 PM - 3:30 PM'),
              ],
            ),
          ),
        ),
      ),


    );
  }
}

