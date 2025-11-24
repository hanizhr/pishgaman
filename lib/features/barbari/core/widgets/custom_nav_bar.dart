import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  final VoidCallback onHomeTap;
  final VoidCallback onProfileTap;
  final VoidCallback onNotifyTap;

  const CustomNavBar({
    super.key,
    required this.onHomeTap,
    required this.onProfileTap,
    required this.onNotifyTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 12,
            offset: Offset(0, -4),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.person_outline, size: 30),
            onPressed: onProfileTap,
          ),
          ElevatedButton(
            onPressed: onNotifyTap,
            child: const Text("اطلاع رسانی"),
          ),
          IconButton(
            icon: Icon(Icons.home, size: 30, color: Colors.blue),
            onPressed: onHomeTap,
          ),
        ],
      ),
    );
  }
}
