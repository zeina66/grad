import 'package:flutter/material.dart';
import 'package:graduation_project/core/theme/app_colors.dart';

class PopularServiceCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final double imageSize;
  final TextStyle? textStyle;

  const PopularServiceCard({
    super.key,
    required this.imagePath,
    required this.title,
    this.imageSize = 60,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 110, // fixed height
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image on top
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath,
              height: 60, // image height
              width: 60,  // image width
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 4),
          // Text below
          Text(
            title,
            textAlign: TextAlign.center,
            style: textStyle ??
                const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2, // keep it inside box
          ),
        ],
      ),
    );
  }
}
