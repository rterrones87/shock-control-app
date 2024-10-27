import 'package:flutter/material.dart';

class newsletter_card_widget extends StatelessWidget {
  final String title;
  final String message;

  const newsletter_card_widget({
    super.key,
    required this.title,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 10,
        // margin: const EdgeInsets.symmetric(horizontal: 0),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
              ),
              Text(
                message,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w200),
              )
            ],
          ),
        ));
  }
}
