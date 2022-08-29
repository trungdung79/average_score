import 'package:flutter/material.dart';

class InformationCard extends StatelessWidget {
  final String firstLabel;
  final String firstContent;
  final String secondLabel;
  final String secondContent;
  const InformationCard({Key? key,
    required this.firstLabel,
    required this.firstContent,
    required this.secondLabel,
    required this.secondContent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Text(firstLabel, style: const TextStyle(color: Colors.blue),),
                Text(firstContent, style: const TextStyle(color: Colors.red),),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text(secondLabel, style: const TextStyle(color: Colors.blue),),
                Text(secondContent, style: const TextStyle(color: Colors.red),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
