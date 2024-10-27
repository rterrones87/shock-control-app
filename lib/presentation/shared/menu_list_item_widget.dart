import 'package:flutter/material.dart';
import 'package:school_control_app/models/menu_options.dart';

class menu_list_item_widget extends StatelessWidget {
  const menu_list_item_widget({
    super.key,
    required this.item,
  });

  final MenuOptions item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(item.title);
      },
      child: Card(
        elevation: 10,
        color: Colors.white,
        child: Container(
          // color: Color.primary,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.title,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Icon(
                item.icon,
                color: Theme.of(context).primaryColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
