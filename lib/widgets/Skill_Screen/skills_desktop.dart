import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/skill_item.dart';

class SkillDesktop extends StatelessWidget {
  const SkillDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center ,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 450,

          ),
          child: Wrap(
            spacing: 5.0,
            runSpacing: 5.0,
            children: [
              for(int i=0;i<platformItems.length;i++)
                Container(
                  width: 200,
                  decoration: BoxDecoration(
                    color: CustomColor.scaffoldBg,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.white.withOpacity(0.3), width: 1),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    leading: platformItems[i]["img"],
                    title: Text(platformItems[i]["title"]),
                  ),
                )
            ],
          ),
        ),
        SizedBox(width: 50,),

        //skill

        Flexible(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 500,
            ),
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                for(int i=0;i<skillItems.length;i++)
                  Chip(
                    backgroundColor: CustomColor.scaffoldBg,
                    padding: EdgeInsets.symmetric(vertical: 12,horizontal: 16),
                    label: Text(skillItems[i]["title"]),
                    avatar: Image.asset(skillItems[i]["img"]),
                  )
              ],
            ),
          ),
        )
      ],
    );
  }
}
