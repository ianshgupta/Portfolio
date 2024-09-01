import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/projects_utils.dart';

import 'project_card.dart';

class Project extends StatelessWidget {
  const Project({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize=MediaQuery.of(context).size;
    final screenWidth=screenSize.width;
    final screenHeight=screenSize.height;

    return Container(
      width: screenWidth,
      padding: EdgeInsets.fromLTRB(25, 20, 25, 60),
      color: CustomColor.scaffoldBg,
      child: Column(
        children: [
          Text("What I've Built",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: CustomColor.whitePrimary
            ),),
          SizedBox(height: 50,),
          ConstrainedBox(
            constraints: BoxConstraints(
                maxWidth: 900
            ),
            child: Wrap(
              spacing: 25,
              runSpacing: 25,
              children: [
                for(int i=0;i<projectUtils.length;i++)
                  ProjectCard(project: projectUtils[i])
              ],
            ),
          ),

          SizedBox(height: 50,),
        ],
      ),

    );
  }
}
