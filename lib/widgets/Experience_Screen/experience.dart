import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';

class Experience extends StatelessWidget {
  const Experience({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 900),
      child: Wrap(
        spacing: 25,
        runSpacing: 25,
        children: [
          _buildEducationCard(
            title: " Flutter App Developer",
            subtitle: "VrajPath itech | May 2024- Present",
            description: "Developed the Rentz dashboard UI with Flutter, integrated backend APIs, and managed features for customers, manufacturers, and service providers.",
          ),
          _buildEducationCard(
            title: " Mobile App Developer",
            subtitle: "Ecell Society | Nov 2023 - Jan 2024",
            description: "Designed the Dhatnoon UI with Flutter, mentored team members, and enhanced project collaboration.",
          ),
        ],
      ),
    );
  }

  Widget _buildEducationCard({
    required String title,
    required String subtitle,
    required String description,
  }) {
    return GestureDetector(
      onTap: () {
        // Handle card tap if needed
      },
      child: Container(
        height: 240,
        width: 260,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: CustomColor.scaffoldBg,
          border: Border.all(color: Colors.white.withOpacity(0.3), width: 1), // Light white border
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 15, 12, 3),
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: CustomColor.whitePrimary,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 5, 12, 10),
              child: Text(
                subtitle,
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 15, 12, 12),
              child: Text(
                description,
                style: TextStyle(
                  fontSize: 15,
                  color: CustomColor.whitePrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
