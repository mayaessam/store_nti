
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';

import '../../../add_product/presentation/widgets/nav_bar.dart';
import '../../../shared/custom_text.dart';
import 'edit_profile.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {

    final List<Map<String, dynamic>> profileItems = [
      {"icon": Icons.favorite_border, "title": "Favorites", "iconArrow":Icons.arrow_forward_ios},
      {"icon": Icons.file_download, "title": "Downloads", "iconArrow":Icons.arrow_forward_ios},
      {"icon": Icons.language_outlined, "title": "Languages", "iconArrow":Icons.arrow_forward_ios},
      {"icon": Icons.location_on, "title": "Location", "iconArrow":Icons.arrow_forward_ios},
      {"icon": Icons.subscriptions_rounded, "title": "Subscription", "iconArrow":Icons.arrow_forward_ios},
      {"icon": Icons.settings_display_rounded, "title": "Display", "iconArrow":Icons.arrow_forward_ios},
      {"icon": Icons.delete, "title": "Clear Cache", "iconArrow":Icons.arrow_forward_ios},
      {"icon": Icons.history, "title": "Clear History ", "iconArrow":Icons.arrow_forward_ios},
      {"icon": Icons.logout, "title": "Log Out", "iconArrow":Icons.arrow_forward_ios},


    ];

    return Scaffold(
      appBar: AppBar(
        actions: [Icon(Icons.settings),],
        leading: Icon(Icons.arrow_back),
        centerTitle: true,
        title: CustomText(text: 'My Profile',size: 25,weight: FontWeight.bold,),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child:
          Column(
            children: [
              Row(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 42,
                        backgroundImage: AssetImage('assets/images/Ellipse 3.png'),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.camera_alt,
                            size: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gap(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(text: 'Sabrina Aryan',weight: FontWeight.bold,size: 28,),
                      CustomText(text: 'SabrinaAry208@gmailcom',size: 20,),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfile()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(12),
                          ),

                          width: 90,height: 30,
                          child: Center(child: CustomText(text: 'Edit Profile',color: Colors.white,)),
                        ),
                      ),


                    ],
                  )
                ],
              ),
              Gap(10)
              ,              ...List.generate(profileItems.length, (index) {
                final item = profileItems[index];

                return Column(
                  children: [
                    ProfileItem(
                      icon: item["icon"],
                      title: item["title"],
                      iconArrow: item["iconArrow"],
                    ),

                    if (index == 1)
                      Divider(thickness: 1, color: Colors.black),

                    if (index == 5)
                      Divider(thickness: 1, color: Colors.black),

                    if (index == profileItems.length - 1)
                      Divider(thickness: 1, color: Colors.black),
                  ],
                );
              }),


            ],
          ),
        ),

      ),
      bottomNavigationBar: const MainBottomNav(currentIndex: 2),

    );
  }
}class ProfileItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final IconData iconArrow;

  const ProfileItem({
    super.key,
    required this.icon,
    required this.title,
    required this.iconArrow,
  });

  @override
  Widget build(BuildContext context) {
    return
      ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Icon(icon, size: 30),
        title:
        CustomText(
          text: title,
          size: 20,
        ),
        trailing: Icon(iconArrow, size: 20),

      );

  }
}
