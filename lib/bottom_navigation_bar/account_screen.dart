import 'package:flutter/material.dart';
import '../about_screen.dart';
import '../developer_names.dart';
import '../update_profile_screen.dart';
import 'navigation_menu.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              // بوش بروح لصفحه وو بوب برجع من صفحه
              context,
              MaterialPageRoute(builder: (context) => NavigationMenu()),
            );
          },
          icon: Icon(Icons.arrow_back),
        ),

        title: Text("Profile"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white54,
          ),
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Stack(
                children: [
                  /// Profile Image
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image(
                        image: AssetImage("assets/images/image4.png"),
                      ),
                    ),
                  ),

                  /// Edit Icon
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.yellow,
                      ),
                      child: const Icon(
                        Icons.edit,
                        size: 20.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),


              const SizedBox(height: 10),

              /// Name + Emai;
              Text(
                "Yomna",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
              ),
              Text(
                "yomnaelghandor@gmail.com",
                style: TextStyle(fontWeight: FontWeight.w200, fontSize: 15),
              ),
              const SizedBox(height: 10),

              /// Edit Profile
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UpdateProfileScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                    side: BorderSide.none,
                    shape: const StadiumBorder(),
                  ),
                  child: Text(
                    "Edit Profile",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              /// Information
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                margin: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: const [
                    Text("user_name: ", style: TextStyle(color: Colors.grey)),
                    Text("@yomnaelnagar"),
                  ],
                ),
              ),

              /// Phone
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                margin: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: const [
                    Text("phone: ", style: TextStyle(color: Colors.grey)),
                    Text("+20 15 51257507"),
                  ],
                ),
              ),

              /// Gender
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                margin: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: const [
                    Text("gender: ", style: TextStyle(color: Colors.grey)),
                    Text("Female"),
                    Icon(Icons.female, color: Colors.purple),
                  ],
                ),
              ),

              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 10),

              /// Menu
              ProfileMenuWidget(
                title: "Favorites",
                icon: Icons.favorite_border,
                onPress: () {},
              ),
              ProfileMenuWidget(
                title: "Languages",
                icon: Icons.language,
                onPress: () {},
              ),
              ProfileMenuWidget(
                title: "About",
                icon: Icons.info_outline,
                onPress: () {
                  Navigator.push(
                    // بوش بروح لصفحه وو بوب برجع من صفحه
                    context,
                    MaterialPageRoute(builder: (context) => AboutScreen()),
                  );
                },
              ),
              const Divider(color: Colors.grey),
              const SizedBox(height: 10),
              ProfileMenuWidget(
                title: "Billing details",
                icon: Icons.payment,
                onPress: () {},
              ),
              ProfileMenuWidget(
                title: "User Management",
                icon: Icons.manage_accounts_outlined,
                onPress: () {},
              ),
              const Divider(color: Colors.grey),
              const SizedBox(height: 10),
              ProfileMenuWidget(
                title: "Settings",
                icon: Icons.settings,
                onPress: () {},
              ), // done
              ProfileMenuWidget(
                title: "Information",
                icon: Icons.insert_chart_outlined_sharp,
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DeveloperNames()),
                  );
                },
              ),
              ProfileMenuWidget(
                title: "LogOut",
                icon: Icons.logout,
                onPress: () {},
                textColor: Colors.red,
                endIcon: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    super.key,
    required this.title,
    required this.icon,
    this.textColor,
    this.endIcon = true,
    required this.onPress,
  });
  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.blueGrey[100],
        ),
        child: IconButton(
          onPressed: () {},
          icon: Icon(icon, color: Colors.indigo),
        ),
      ),
      title: Text(title, style: TextStyle(color: textColor)),
      trailing:
      endIcon
          ? Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.grey.withOpacity(0.2),
        ),
        child: const Icon(
          Icons.arrow_forward_ios_rounded,
          size: 18.0,
          color: Colors.indigo,
        ),
      )
          : null,
    );
  }
}
