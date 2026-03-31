import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Map<String, dynamic>? ventor;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadVentorData();
  }

  void loadVentorData() {
    final box = Hive.box('ventorBox');
    setState(() {
      ventor = Map<String, dynamic>.from(box.get('ventor'));
    });
  }

  @override
  Widget build(BuildContext context) {
    if (ventor == null || ventor!.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
          backgroundColor: Colors.green[300],
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        body: Center(child: Text("No ventor Data Found")),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Colors.green[300],
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(radius: 80,backgroundImage: NetworkImage("data:image/jpeg;base64,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"),),
              SizedBox(height: 10,),
              Text("Name: ${ventor!['name']}", style: TextStyle(fontSize: 18)),
              Divider(),
              SizedBox(height: 10,),
              Text("Email: ${ventor!['email']}", style: TextStyle(fontSize: 18)),
              Divider(),
              SizedBox(height: 10,),
              Text("Phone: ${ventor!['phone']}",style: TextStyle(fontSize: 18)),
              Divider(),
              SizedBox(height: 10,),
              Text("UserName: ${ventor!['userName']}",style: TextStyle(fontSize: 18))
            ],
          ),
        ),
      ),
    );
  }
}
