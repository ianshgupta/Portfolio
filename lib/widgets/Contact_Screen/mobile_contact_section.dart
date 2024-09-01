import 'dart:developer';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/widgets/custom_textfield.dart';
import 'package:url_launcher/url_launcher.dart';

class MobContactSection extends StatelessWidget {
  MobContactSection({Key? key}) : super(key: key);

  final String email = 'abhinsh1264@gmail.com';

  void _showEmailDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Contact Me'),
          content: Text('Mail me at $email'),
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

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 180,
        width: 560,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: CustomColor.scaffoldBg,
          border: Border.all(
              color: Colors.white.withOpacity(0.3),
              width: 1), // Light white border
        ),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            const Text(
              "Where to find me",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: CustomColor.whitePrimary),
            ),
            const SizedBox(height: 50),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: CustomColor.bgLight1,
                    child: IconButton(
                        onPressed: () {
                          _launchURL('https://github.com/Ansh-Gupta-Official');
                        },
                        icon: Icon(EvaIcons.github)),
                  ),
                  const SizedBox(width: 20),
                  CircleAvatar(
                    backgroundColor: CustomColor.bgLight1,
                    child: IconButton(
                        onPressed: () {
                          _launchURL(
                              'https://www.linkedin.com/in/ansh-gupta-931425220');
                        },
                        icon: Icon(EvaIcons.linkedin)),
                  ),
                  const SizedBox(width: 20),
                  CircleAvatar(
                    backgroundColor: CustomColor.bgLight1,
                    child: InkWell(
                      onTap: () {
                        _launchURL(
                            'https://auth.geeksforgeeks.org/user/geekcoder234');
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          "assets/gfg.png",
                          color: Colors.white,
                          width: 30,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  CircleAvatar(
                      backgroundColor: CustomColor.bgLight1,
                      child: InkWell(
                        onTap: () {
                          _launchURL('https://leetcode.com/Ansh-Gupta/');
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            "assets/leetcode.png",
                            width: 20,
                            color: Colors.white,
                          ),
                        ),
                      )),
                  const SizedBox(width: 20),
                  CircleAvatar(
                    backgroundColor: CustomColor.bgLight1,
                    child: IconButton(
                        onPressed: () {
                          _showEmailDialog(context);
                        },
                        icon: Icon(EvaIcons.email)),
                  ),
                  const SizedBox(width: 20),
                  CircleAvatar(
                    backgroundColor: CustomColor.bgLight1,
                    child: IconButton(
                        onPressed: () {
                          _launchURL('https://www.instagram.com/anshh.gupta/');
                        },
                        icon: Icon(Icons.person)),
                  ),
                ]),
          ],
        ));
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
