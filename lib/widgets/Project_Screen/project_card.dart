import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/projects_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({Key? key, required this.project}) : super(key: key);
final ProjectUtils project;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: 330,
      width: 260,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: CustomColor.scaffoldBg,
        border: Border.all(color: Colors.white.withOpacity(0.3), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(project.image, height: 140,width: 260,fit: BoxFit.cover,),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 15, 12, 12),
            child: Text(project.title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: CustomColor.whitePrimary,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: Text(project.subtitle,
              style: TextStyle(
                fontSize: 10,
                color: CustomColor.whitePrimary,
              ),
            ),
          ),
          Container(
            color: CustomColor.bgLight1,
            padding: EdgeInsets.symmetric(horizontal: 12,vertical: 2),
            child: Row(
              children: [
                Text("Available on:",
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 10,
                  ),),
                Spacer(),

                IconButton(onPressed: (){}, icon: Icon(Icons.android_rounded,size: 17,)),
                IconButton(onPressed: (){_launchURL(project.githubLink);}, icon: Icon(EvaIcons.github,size: 17,)),
              ],
            ),
          )
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
