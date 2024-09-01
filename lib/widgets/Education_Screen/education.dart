import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';

class Education extends StatelessWidget {
  const Education({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 900),
      child: Wrap(
        spacing: 25,
        runSpacing: 25,
        children: [
          _buildEducationCard(
            title: "B.Tech CS",
            subtitle: "2021 - 2025",
            description: "From SAGE University, Bhopal \n\n\n• CGPA‐ 9.54 (till VI Semester)",
          ),
          _buildEducationCard(
            title: "Class X to XII",
            subtitle: "2019 - 2021",
            description: "From Gurunanak Public School, Dabra\n\n• Class XII & X ‐ Percentage 90.8",
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
        height: 200,
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
                  fontSize: 10,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
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
