import 'package:flutter/material.dart';
import 'package:study_squad/services/auth.dart';

final class SettingsItem {
  String name;
  IconData icon;

  SettingsItem(this.name, this.icon);
}

class Settings extends StatefulWidget {
  @override
  State<Settings> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<Settings> {
  AuthService _authService=AuthService();
  List<SettingsItem> items = [
    SettingsItem("Account Settings", Icons.person),
    SettingsItem("Payment Methods", Icons.credit_card),
    SettingsItem("Privacy & Security", Icons.shield),
    SettingsItem("Help & Support", Icons.headset),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Profile", style:TextStyle(fontWeight: FontWeight.w800),),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          actions:  [
            IconButton(
                icon: Icon(Icons.notifications, size: 20,),
              onPressed: (){},
            )
          ],
        ),
        body: Container(
          margin: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(16.0),
                        child: const Icon(Icons.photo), // placeholder, replace with image
                      ),
                      const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "StudySquad",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w700
                                  )
                              ),
                              Text("Join our community!")
                            ],
                          )
                      ),
                      IconButton(onPressed: (){}, icon: Icon(Icons.edit))
                    ],
                  ),
                  MenuItemButton(
                    onPressed: () {
                      // profile edit page
                    },
                    child: const Text("Edit Profile"),
                  ),
                ],
              ),
              Container(
                height: 230,
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: Icon(items[index].icon, size: 32.0),
                        title: Text(items[index].name, style: TextStyle(fontWeight: FontWeight.w600),),
                        trailing: Icon(Icons.arrow_forward),
                        onTap: () {
                          // action
                        },
                      );
                    },
                  )
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                  ),
                  textStyle: TextStyle(
                    fontWeight:FontWeight.w600,
                    fontSize: 22,
                  ),
                  backgroundColor: Color.fromRGBO(250, 172, 140,0.2),
                  foregroundColor: Colors.black,
                  elevation: 0,
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 100),
                ),

                  onPressed:() {
                  },
                  child: Text("Delete Account")
              )
            ],
          ),
        ),

    );
  }
}
