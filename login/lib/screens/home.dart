import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:login/screens/login.dart';
import 'package:login/services/firebase_services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Primary'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
      ),
      drawer: Drawer(
        child: Column(
          /*  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(FirebaseAuth.instance.currentUser!.photoURL!),
            SizedBox(
              height: 20,
            ),
            Text("${FirebaseAuth.instance.currentUser!.displayName}"),
            Text("${FirebaseAuth.instance.currentUser!.email}"),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: Text("Logout"),
              onPressed: () async {
                await FirebaseServices().googleSignOut();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LoginScreen()));
              },
            ),
          ],
        ),
      ),
        );
        }*/
          children: <Widget>[
            Container(
              height: 160.0,
              decoration: BoxDecoration(color: Colors.white),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 25.0),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          FirebaseAuth.instance.currentUser!.photoURL!),
                      backgroundColor: Colors.white,
                      radius: 30.0,
                    ),
                    Text("${FirebaseAuth.instance.currentUser!.displayName}"),
                    Text("${FirebaseAuth.instance.currentUser!.email}"),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      child: Text("Logout"),
                      onPressed: () async {
                        await FirebaseServices().googleSignOut();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.edit,
        ),
        onPressed: () {
          print('compose Mail');
        },
      ),
      body: Column(
        children: <Widget>[
          topTail(
              title: 'Social',
              subtitle: 'Google+',
              idata: Icons.people), // might change to Phishing/ non Phishing!
          Divider(height: 0.1),
          topTail(
              title: 'Promotions', subtitle: 'New items', idata: Icons.more),
          Divider(height: 0.1),
          topTail(
              title: 'Updates',
              subtitle: 'See what is going on',
              idata: Icons.info),
          Divider(height: 0.1),
          msgTail(
              url: 'assets/images/1.png',
              name: 'CyberPhish',
              msg: 'UI',
              Icolor: Colors.green,
              status: 'Safe',
              isUnread: false), // for time add logs
          msgTail(
              url: 'assets/images/1.png',
              name: 'Leen',
              msg: 'Go',
              Icolor: Colors.orange,
              status: 'Warning',
              isUnread: true),
          msgTail(
              url: 'assets/images/1.png',
              name: 'Joud',
              msg: 'Hi',
              Icolor: Colors.red,
              status: 'Phishing',
              isUnread: false),
        ],
      ),
    );
  }
}

ListTile msgTail(
    {required String url,
    required String name,
    required String msg,
    required Color Icolor,
    required String status,
    required bool isUnread}) {
  // receive logs here
  return ListTile(
    leading: CircleAvatar(
      radius: 20.0,
      backgroundImage: ExactAssetImage(url),
    ),
    title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            name,
            style: TextStyle(
                fontWeight: isUnread ? FontWeight.bold : FontWeight.normal),
          )
        ] // for logs add it here as text
        ),
    subtitle: Text(msg),
    trailing: Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3.0),
      color: Icolor,
      child: Text(
        status,
        style: TextStyle(color: Colors.white),
      ),
    ),
  );
}

ListTile topTail(
    {required String title,
    required String subtitle,
    required IconData idata}) {
  return ListTile(
    leading: Icon(idata, color: Colors.blue),
    title: Text(
      title,
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    subtitle: Text(subtitle),
  );
}
