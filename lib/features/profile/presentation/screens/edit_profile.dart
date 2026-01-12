
import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Column(
          children: [

            Stack(
              clipBehavior: Clip.none,
              children: [
                // Top curved background
                Container(
                  height: 140,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xff8b2e3c),
                        Color(0xffd9d9d9),
                      ],
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(60),
                      bottomRight: Radius.circular(60),
                    ),
                  ),
                ),

                // Back arrow
                const Positioned(
                  top: 50,
                  left: 20,
                  child: Icon(
                    Icons.arrow_back,
                    size: 28,
                    color: Colors.white,
                  ),
                ),

                Positioned(
                  bottom: -55,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          CircleAvatar(
                            radius: 55,
                            backgroundImage: AssetImage('assets/images/Ellipse 3.png'),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              padding: EdgeInsets.all(6),
                              decoration: const BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.edit,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )

            , SizedBox(height: 60),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Edit Profile",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  customLabel("First Name"),
                  customInput("Sabrina"),

                  customLabel("Last Name"),
                  customInput("Aryan"),

                  customLabel("Username"),
                  customInput("@Sabrina"),

                  customLabel("Email"),
                  customInput("@SabrinaAry208@gmailcom"),

                  customLabel("Phone Number"),
                  phoneField(),

                  customLabel("Birth"),
                  dropdownInput(),

                  customLabel("Gender"),
                  dropdownInput(),

                  const SizedBox(height: 25),

                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xff004b85),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Change Password",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.lock, color: Colors.white),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget customLabel(String text) => Padding(
    padding: const EdgeInsets.only(bottom: 6, top: 12),
    child: Text(
      text,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
    ),
  );

  Widget customInput(String placeholder) => Container(
    height: 50,
    padding: const EdgeInsets.symmetric(horizontal: 12),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black, width: 1),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(
        placeholder,
        style: const TextStyle(fontSize: 16),
      ),
    ),
  );

  Widget phoneField() => Container(
    height: 50,
    padding: const EdgeInsets.symmetric(horizontal: 12),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      children: const [
        Text(
          "+234",
          style: TextStyle(fontSize: 16),
        ),
        Icon(Icons.keyboard_arrow_down),
        SizedBox(width: 10),
        VerticalDivider(width: 1, thickness: 1),
        SizedBox(width: 10),
        Text(
          "904 6470",
          style: TextStyle(fontSize: 16),
        ),
      ],
    ),
  );

  Widget dropdownInput() => Container(
    height: 50,
    padding: const EdgeInsets.symmetric(horizontal: 12),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text(
          "",
          style: TextStyle(fontSize: 16),
        ),
        Icon(Icons.keyboard_arrow_down),
      ],
    ),
  );
}
