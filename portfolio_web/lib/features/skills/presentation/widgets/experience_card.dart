import 'package:flutter/material.dart';

class ExperienceCard extends StatelessWidget {
  final VoidCallback onDownloadCV;

  const ExperienceCard({super.key, required this.onDownloadCV});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 340,
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "7+",
            style: TextStyle(
              color: Colors.white,
              fontSize: 60,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Months\nExperience\nWorking",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: onDownloadCV,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFE0F780),
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text(
              "DOWNLOAD MY CV",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
