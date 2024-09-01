import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/nav_items.dart';
import 'package:portfolio/constants/projects_utils.dart';
import 'package:portfolio/constants/sizes.dart';
import 'package:portfolio/constants/skill_item.dart';
import 'package:portfolio/widgets/Contact_Screen/contact_section.dart';
import 'package:portfolio/widgets/custom_textfield.dart';
import 'package:portfolio/widgets/Education_Screen/education.dart';
import 'package:portfolio/widgets/Experience_Screen/experience.dart';
import 'package:portfolio/widgets/Main_Screen/main_desktop.dart';
import 'package:portfolio/widgets/Contact_Screen/mobile_contact_section.dart';
import 'package:portfolio/widgets/Project_Screen/project_card.dart';
import 'package:portfolio/widgets/Project_Screen/project_section.dart';
import 'package:portfolio/widgets/Skill_Screen/skill_mobile.dart';
import 'package:portfolio/widgets/Skill_Screen/skills_desktop.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/Main_Screen/main_mobile.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final List<GlobalKey> navbarKeys = List.generate(5, (index) => GlobalKey());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: CustomColor.scaffoldBg, // Dark grey background
          body: SingleChildScrollView(
            controller: scrollController,
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: constraints.maxWidth>=800? EdgeInsets.all(80.0) :EdgeInsets.all(10.0),
              child: Column(
                children: [
                  // Removed the header
                  SizedBox(key: navbarKeys.first),
                  if (constraints.maxWidth >= 800)
                    const MainDesktop()
                  else
                    const MainMobile(),
                  const Divider(height: 2), // Reduced divider height

                  // About Me
                  Container(
                    width: screenWidth,
                    padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                    color: CustomColor.scaffoldBg,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "What's My Education",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: CustomColor.whitePrimary,
                          ),
                        ),
                        const SizedBox(height: 50),
                        Education(),
                      ],
                    ),
                  ),

                  const Divider(height: 2), // Reduced divider height

                  // Where I've Worked
                  Container(
                    key: navbarKeys[1],
                    width: screenWidth,
                    padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                    color: CustomColor.scaffoldBg,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "Where I've Worked",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: CustomColor.whitePrimary,
                          ),
                        ),
                        const SizedBox(height: 50),
                        Experience(),
                      ],
                    ),
                  ),

                  const Divider(height: 2), // Reduced divider height

                  // Skills
                  Container(
                    key: navbarKeys[2],
                    width: screenWidth,
                    padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                    color: CustomColor.scaffoldBg,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "What I can do",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: CustomColor.whitePrimary,
                          ),
                        ),
                        const SizedBox(height: 50),
                        if (constraints.maxWidth >= 800)
                          const SkillDesktop()
                        else
                          const SkillMobile(),
                      ],
                    ),
                  ),

                  const Divider(height: 2), // Reduced divider height

                  // Projects
                  Project(key: navbarKeys[3]),

                  const Divider(height: 2), // Reduced divider height
                   SizedBox(height: 50,),
                  // Contact
                  if (constraints.maxWidth >= 800)
                     ContactSection()
                  else
                    MobContactSection(),
                  SizedBox(height: 50,),
                  const Divider(height: 2), // Reduced divider height

                  SizedBox(height: 30),

                  // Footer
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    width: double.maxFinite,
                    alignment: Alignment.center,
                    child: Text(
                      "Made by Ansh Gupta",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: CustomColor.whitePrimary),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void scrollToSection(int navIndex) {
    if (navIndex == 5) {
      return;
    }
    final key = navbarKeys[navIndex];
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: Duration(milliseconds: 50),
      curve: Curves.easeInOut,
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