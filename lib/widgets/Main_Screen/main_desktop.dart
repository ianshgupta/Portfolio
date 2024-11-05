import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

class MainDesktop extends StatelessWidget {
  const MainDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('EEE, d MMM, h:mm a').format(DateTime.now());

    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    // Breakpoints for responsive design
    bool isTablet = screenWidth >= 600 && screenWidth < 1200;
    bool isDesktop = screenWidth >= 1200;
    bool isMobile = screenWidth < 600;

    double profileImageRadius = isDesktop ? 50 : isTablet ? 40 : 30;
    double nameFontSize = isDesktop ? 38 : isTablet ? 32 : 24;
    double professionFontSize = isDesktop ? 16 : isTablet ? 14 : 12;
    double bioFontSize = isDesktop ? 16 : isTablet ? 14 : 12;
    double paddingHorizontal = isDesktop ? 250.0 : isTablet ? 150.0 : 50.0;

    final String email = 'abhinsh1264@gmail.com';

    void _showEmailDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Mail Me'),
            content: Text(' at $email'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: email));
                  Navigator.of(context).pop(); // Close the dialog
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Email copied to clipboard!')));
                },
                child: Text('Copy'),
              ),
            ],
          );
        },
      );
    }
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      height: screenHeight / 1.2,
      color: CustomColor.scaffoldBg,
      constraints: BoxConstraints(minHeight: 350),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Profile Section
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 120, // Adjust the width to fit the glow and avatar
                height: 120, // Adjust the height to fit the glow and avatar
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.6), // Glowing blue color
                      blurRadius: 10, // Adjust for the glow intensity
                      spreadRadius: 4, // Adjust for the glow size
                    ),
                  ],
                ),
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/ansh.png'), // Replace with your image asset
                  backgroundColor: Colors.blue, // Blue border color
                ),
              ),
              SizedBox(width: isDesktop ? 40 : 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ansh Gupta',
                    style: TextStyle(
                      fontSize: nameFontSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Software Developer',
                    style: TextStyle(
                      fontSize: professionFontSize,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: isDesktop ? 20 : 10),
                  // Social Links
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          _launchURL('https://leetcode.com/ianshgupta/');
                        },
                        child: Image.asset(
                          'assets/leetcode.png',
                          width: 24,
                          height: 24,
                          color: Colors.orangeAccent,
                        ),
                      ),
                      SizedBox(width: 10),
                      IconButton(
                        onPressed: () {
                          _launchURL('https://github.com/ianshgupta');
                        },
                        icon: Icon(EvaIcons.github, color: Colors.white),
                      ),
                      SizedBox(width: 10),
                      InkWell(
                        onTap: () {
                          _launchURL(
                              'https://auth.geeksforgeeks.org/user/geekcoder234');
                        },
                        child: Image.asset(
                          'assets/gfg.png',
                          width: 24,
                          height: 24,
                          color: Colors.green,
                        ),
                      ),
                      SizedBox(width: 10),
                      IconButton(
                        icon: Icon(Icons.mail_outline_outlined, color: Colors.red),
                        onPressed: () {
                          _showEmailDialog(context);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: isDesktop ? 40 : 20),
          // Bio Section
          Padding(
            padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
            child: Text(
              'Hi! I am a final-year CS student at Sage University. I’m passionate about Flutter development and work as a flutter developer and a freelancer, crafting elegant and functional mobile applications. Excited about the future and always eager to learn and grow in the tech world!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: bioFontSize,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: isDesktop ? 50 : 30),
          // Date and Buttons
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isMobile
                  ? Column(
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          // Add your button action here
                        },
                        icon: Icon(EvaIcons.linkedin, color: Colors.white),
                        label: Text('Connect', style: TextStyle(color: Colors.white)),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton.icon(
                        onPressed: () {
                          _launchURL("https://drive.google.com/file/d/1kclMyJRa0zRsRAagGUWKrxXQDmdTKA9g/view?usp=sharing");
                        },
                        icon: Icon(Icons.person_outline_outlined, color: Colors.white),
                        label: Text('Resume', style: TextStyle(color: Colors.white)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          side: BorderSide(color: Colors.white.withOpacity(0.3), width: 1.0), // Light white border
                        ),
                      ),
                    ],
                  )
                  : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    formattedDate,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(width: 150),
                  ElevatedButton.icon(

                    onPressed: () {
                      _launchURL(
                          'https://www.linkedin.com/in/ianshgupta');
                    },
                    icon: Icon(EvaIcons.linkedin, color: Colors.white),
                    label: Text('Connect', style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton.icon(
                    onPressed: () {
                      _launchURL("https://drive.google.com/file/d/1kclMyJRa0zRsRAagGUWKrxXQDmdTKA9g/view?usp=sharing");
                    },
                    icon: Icon(Icons.person_outline_outlined, color: Colors.white),
                    label: Text('Resume', style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      side: BorderSide(color: Colors.white.withOpacity(0.3), width: 1.0), // Light white border
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
