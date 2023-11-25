import 'package:flutter/material.dart';
import 'package:study_squad/routes.dart';
import 'package:study_squad/services/auth.dart';
class Profile extends StatelessWidget {
  BuildContext? homeContext;
  Profile({super.key, this.homeContext});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  height: 100,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 25,
                        left: 20,
                        child: IconButton(
                          icon: Icon(Icons.settings, size: 30,),
                          onPressed: (){
                            Navigator.of(homeContext!).pushNamed(RouteManager.settingsPage);
                          },
                        ),
                      ),
                      Center(
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage('https://th.bing.com/th/id/R.c3470df7457cc93c9de8784644843884?rik=1rPldIM9Jb%2fL5w&pid=ImgRaw&r=0'),
                        ),
                      ),
                      Positioned(
                        top: 25,
                        right: 20,
                        child: IconButton(
                          icon: Icon(Icons.logout, size: 30,),
                          onPressed: () async{
                            await AuthService().logout();
                          },
                        ),
                      ),

                    ],

                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  'John Doe',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                  ),
                ),
                SizedBox(height: 6,),
                Text(
                  '@johndoe',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          "15",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17
                          ),

                        ),
                        Text(
                          "Courses",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                          ),

                        ),

                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "24",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17
                          ),

                        ),
                        Text(
                          "Groups",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                          ),

                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Text(
                    "My Profile",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(horizontal: 34),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Icon(Icons.stacked_line_chart, size: 40,),
                          SizedBox(height: 10,),
                          Text("149",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 20
                            ),
                          ),
                          SizedBox(height: 4,),
                          Text("Courses\ncompleted",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.local_fire_department_outlined, size: 40,),
                          SizedBox(height: 10,),
                          Text("18 900",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 20
                            ),
                          ),
                          SizedBox(height: 4,),
                          Text("Minutes\nstudied",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.celebration, size: 40,),
                          SizedBox(height: 10,),
                          Text("53",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 20
                            ),
                          ),
                          SizedBox(height: 4,),
                          Text("Badges\nearned",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                ),
                ListTile(
                  title: Text(
                    "Leaderboard",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,

                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, color: Colors.black, size: 20,),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    color: Colors.grey[200],
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Row(
                      children: [
                        TextButton(
                          onPressed: (){},
                          child: Text("All Time",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(width: 20,),
                        TextButton(
                          onPressed: (){},
                          child: Text("Today",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(width: 20,),
                        TextButton(
                          onPressed: (){},
                          child: Text("Week",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(width: 20,),
                        TextButton(
                          onPressed: (){},
                          child: Text("Month",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 300,
                  color: Color.fromARGB(50, 220, 215, 204),
                  child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: (context, index){
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        child: ListTile(
                          leading: Text("#${index+1}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
                          trailing: Text("${(3-index)*24+130}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                          title: Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage: NetworkImage('https://th.bing.com/th/id/R.c3470df7457cc93c9de8784644843884?rik=1rPldIM9Jb%2fL5w&pid=ImgRaw&r=0'),
                              ),
                              SizedBox(width: 10,),
                              Text("${index+1}st person", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Text(
                    "Achievements",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(height:10),
                achievements("Knowledge guru", "Study for 800 hours", 360, 800),
                achievements("Weekender", "Two study sessions on weekend", 1,2),
                achievements("Super Brain", "Master 5 difficult Subjects!", 4, 5),
              ],
            ),
          ),
    );

  }
}

Widget achievements(String achName, String achDetails, int completed, int total){
  return Container(
    height: 170,
    margin: EdgeInsets.all(15),
    padding: EdgeInsets.all(15),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Color.fromARGB(155, 220, 215, 204),
    ),
    child: Stack(
      children: [
        Positioned(
          top: 8,
          left: 10,
          child: Text(
            achName,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Positioned(
          top:40,
          left: 10,
          child: Text(
            achDetails,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Positioned(
          top: 95,
          left: 10,
          child: Text(
            "Progress",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),

          ),
        ),
        Positioned(
          top: 95,
          right: 20,
          child: Text("$completed/$total",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Positioned(
          top: 118,
          left: 10,
          child: customProgressBar(completed, total),
        ),

      ],

    ),
  );

}

Widget customProgressBar(int completed, int total){
  Widget temp1=Container(
    height: 6,
    width: 330,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
    ),
  );
  Widget temp2=Container(
    height: 6,
    width: (completed/total)*330,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Color.fromRGBO(236, 143, 94,1),
    ),
  );
  return Center(
    child: Stack(
      children: [
        temp1,
        temp2
      ],
    ),
  );
}
