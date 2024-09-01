import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/skill_item.dart';
class SkillMobile extends StatelessWidget {
  const SkillMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for(int i=0;i<platformItems.length;i++)
          Container(
            margin: EdgeInsets.only(bottom: 5),
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: CustomColor.scaffoldBg,
              border: Border.all(color: Colors.white.withOpacity(0.3), width: 1),
              borderRadius: BorderRadius.circular(5),
            ),
            child: ListTile(

              contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              leading:
              platformItems[i]["img"],
              title: Text(platformItems[i]["title"]),
            ),
          ),
        SizedBox(height: 50,),
        //Skills

        Wrap(
          spacing: 10,
          runSpacing: 10,
          alignment: WrapAlignment.center,
          children: [
            for(int i=0;i<skillItems.length;i++)
              Chip(
                backgroundColor: CustomColor.scaffoldBg,
                padding: EdgeInsets.symmetric(vertical: 12,horizontal: 16),
                label: Text(skillItems[i]["title"]),
                avatar: Image.asset(skillItems[i]["img"]),
              )
          ],
        )
      ],
    );
  }
}
