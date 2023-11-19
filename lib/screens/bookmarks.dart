import 'package:flutter/material.dart';
class Bookmarks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '       Your Bookmarked Flows',
            style: TextStyle(
              color: Color(0xFF030303),
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: InkWell(
            onTap: () {
              // Handle icon press
            },
            child: Icon(
              Icons.arrow_left,
              color: Colors.black,
              size: 25.0,
            ),
          ), // Add back button here
          backgroundColor: Colors.white,
          elevation: 4.0,
        ),
        body: DefaultTextStyle(
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
          child: MyHomePage(),
        ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Remove the custom container used for the top bar
        Expanded(
          child: Container(
            color: Color(0xFFF2CECD), // Set background color here
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 40.0, left: 20.0),
                    child: Text(
                      'Recently Bookmarked',
                      style: TextStyle(
                        color: Color(0xFF050505),
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Bookmarked Flows
                  Column(
                    children: [
                      _buildBookmarkedFlow(
                        '     Math Study ',
                        'https://assets.api.uizard.io/api/cdn/stream/4af56cc6-06f4-4f3a-ac8e-e812465ff94a.png',
                      ),
                      _buildBookmarkedFlow(
                        '     Science Study ',
                        'https://assets.api.uizard.io/api/cdn/stream/586a2e6a-c846-402a-83a3-56cb6ba06203.png',
                      ),
                      _buildBookmarkedFlow(
                        '     10-min Study ',
                        'https://images.unsplash.com/photo-1484820540004-14229fe36ca4?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wyMDUzMDJ8MHwxfHNlYXJjaHw1fHxCb29rcyUyQyUyMFN0dWR5JTJDJTIwRWR1Y2F0aW9ufGVufDF8fHx8MTY5ODA4MzA3MXww&ixlib=rb-4.0.3&q=80&w=1080',
                      ),
                      // Add more bookmarked flows as needed
                    ],
                  ),
                  // Most Popular
                  Container(
                    margin: EdgeInsets.only(top: 12.0, left: 20.0),
                    child: Text(
                      'Most Popular',
                      style: TextStyle(
                        color: Color(0xFF050505),
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      _buildMostPopularItem(
                        '     English Study ',
                        'https://images.unsplash.com/photo-1434030216411-0b793f4b4173?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wyMDUzMDJ8MHwxfHNlYXJjaHwyfHxEaWN0aW9uYXJ5JTJDJTIwTGFuZ3UljMjAyMy0xMS0xNi5wbmcifQ&ixlib=rb-4.0.3&q=80&w=1080',
                      ),
                      // Add more Most Popular items as needed
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        // Bottom Bar
      ],
    );
  }

  // ... (rest of the code remains unchanged)

  Widget _buildBookmarkedFlow(String title, String imageUrl) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 88.0,
            width: 120.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 4.0,
                  spreadRadius: 0.0,
                ),
              ],
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 6.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Color(0xFF050505),
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        // Handle arrow press
                      },
                      child: Container(
                        width: 32.0,
                        height: 32.0,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 4.0,
                              spreadRadius: 0.0,
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.play_arrow,
                          size: 10.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMostPopularItem(String title, String imageUrl) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 88.0,
            width: 120.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 4.0,
                  spreadRadius: 0.0,
                ),
              ],
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Color(0xFF050505),
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        // Handle arrow press
                      },
                      child: Container(
                        width: 32.0,
                        height: 32.0,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 4.0,
                              spreadRadius: 0.0,
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.play_arrow,
                          size: 10.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
