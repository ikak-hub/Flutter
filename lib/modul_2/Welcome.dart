import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Welcome(),
    );
  }
}

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            // ======================
            // STACK (Header Profile)
            // ======================
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 150,
                  width: double.infinity,
                  color: Colors.blue,
                ),
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 50),
                ),
              ],
            ),

            SizedBox(height: 20),

            // ======================
            // CONTAINER DI DALAM COLUMN
            // ======================
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text(
                    "Selamat Datang",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Ini contoh Container di dalam Column",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // ======================
            // ROW
            // ======================
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Menu",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Icon(Icons.more_horiz),
                ],
              ),
            ),

            SizedBox(height: 10),

            // ======================
            // GRIDVIEW
            // ======================
            Container(
              height: 200,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  menuItem(Icons.home, "Home"),
                  menuItem(Icons.person, "Profile"),
                  menuItem(Icons.settings, "Settings"),
                  menuItem(Icons.logout, "Logout"),
                ],
              ),
            ),

            SizedBox(height: 20),

            // ======================
            // LISTVIEW
            // ======================
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Aktivitas",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),

            SizedBox(
              height: 200,
              child: ListView(
                children: [
                  listItem("Login berhasil"),
                  listItem("Update profil"),
                  listItem("Tambah data"),
                  listItem("Logout"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget Menu Grid
  Widget menuItem(IconData icon, String title) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: Colors.blue),
          SizedBox(height: 10),
          Text(title),
        ],
      ),
    );
  }

  // Widget List Item
  Widget listItem(String title) {
    return ListTile(
      leading: Icon(Icons.check_circle, color: Colors.green),
      title: Text(title),
    );
  }
}