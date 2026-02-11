import 'package:flutter/material.dart';
import '../../widgets/actions/bla_button.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 16,
            children: [
              // Primary - Label only
              BlaButton(
                label: 'Primary Button',
                isPrimary: true,
                onPressed: () {},
              ),

              // Primary - Label + Icon
              BlaButton(
                label: 'Request to book',
                isPrimary: true,
                icon: Icons.calendar_today,
                onPressed: () {},
              ),

              // Secondary - Label only
              BlaButton(
                label: 'Secondary Button',
                isPrimary: false,
                onPressed: () {},
              ),

              // Secondary - Label + Icon
              BlaButton(
                label: 'Contact Voladia',
                isPrimary: false,
                icon: Icons.chat_outlined,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
