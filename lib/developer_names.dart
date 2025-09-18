import 'package:flutter/material.dart';

class DeveloperNames extends StatelessWidget {
  const DeveloperNames({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Developers Names"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(children: [
          /// Logo
          SizedBox(
            width: 120,
            height: 120,
            child:
            Container(

              decoration: BoxDecoration(
                color: Colors.blueGrey.shade50,
                border: Border.all(
                  color: Colors.grey,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(100),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child:
                Image(image: AssetImage("assets/images/image4.png")),
              ),
            ),),
          const SizedBox(height: 10),

          /// Title
          const Text(
            "Yomna Elghandor",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),


          /// About owner
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "About the Owner",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),

          const SizedBox(height: 8),

          /// Email
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: const [
                Text("Email: ", style: TextStyle(color: Colors.grey)),
                Text("yomnaelghandor@gmail.com"),
              ],
            ),
          ),

          /// Phone
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: const [
                Text("Phone: ", style: TextStyle(color: Colors.grey)),
                Text("20 15 51257507"),
              ],
            ),
          ),

          /// Gender
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: const [
                Text("Gender: ", style: TextStyle(color: Colors.grey)),
                Text("Female"),
                Icon(Icons.female, color: Colors.purple,)
              ],
            ),
          ),

          /// University
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: const [
                Text("University: ", style: TextStyle(color: Colors.grey)),
                Text("Mansoura National University"),
              ],
            ),
          ),

          /// collage
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: const [
                Text("College: ", style: TextStyle(color: Colors.grey)),
                Text("Engineering"),
              ],
            ),
          ),

          /// Grade
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: const [
                Text("Grade: ", style: TextStyle(color: Colors.grey)),
                Text("2nd grade"),
              ],
            ),
          ),

          //SizedBox(height: 20,),

          // SizedBox(
          //   width: double.infinity,
          //   child: OutlinedButton(
          //     onPressed: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (context) => HomeScreen()),
          //       );
          //     },
          //     style: OutlinedButton.styleFrom(
          //       padding: const EdgeInsets.symmetric(vertical: 15),
          //       side: const BorderSide(color: Colors.red),
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(10),
          //       ),
          //     ),
          //     child: const Text(
          //       "Contact Us",
          //       style: TextStyle(fontSize: 16, color: Colors.red),
          //     ),
          //   ),
          // ),
        ],),
      ),
    );
  }
}
