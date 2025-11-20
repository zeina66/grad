import 'package:flutter/material.dart';
import 'package:graduation_project/core/theme/app_colors.dart';

class ServiceProviderCard extends StatelessWidget {
  final String name;
  final String job;
  final double rating;
  final String imagePath;
 // <-- new parameter

  const ServiceProviderCard({
    super.key,
    required this.name,
    required this.job,
    required this.rating,
    required this.imagePath,
    // <-- new parameter
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: AppColors.primary,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image container
          Container(
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(

              color: AppColors.primary,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),

              ),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: Image.asset(
                imagePath, // <-- use the imagePath parameter
                fit: BoxFit.cover,
                height: 120,
                width: double.infinity,
              ),
            ),
          ),

          const SizedBox(height: 8),

          Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: AppColors.textDark,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),

          Text(
            job,
            style: const TextStyle(
              color: AppColors.primary,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 8),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.star, color: Colors.amber, size: 19),
              const SizedBox(width: 4),
              Text(
                rating.toString(),
                style: const TextStyle(color: AppColors.textDark),
              ),
            ],
          ),

          const SizedBox(height: 8),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                ),
                child: const Text(
                  'Details',
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ),
            ),
          ),

          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
